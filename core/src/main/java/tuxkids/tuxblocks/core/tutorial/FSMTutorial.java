package tuxkids.tuxblocks.core.tutorial;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import playn.core.Json;
import playn.core.PlayN;
import playn.core.util.Clock;
import tuxkids.tuxblocks.core.story.StoryGameState;
import tuxkids.tuxblocks.core.tutorial.Tutorial.Tag;
import tuxkids.tuxblocks.core.tutorial.Tutorial.Trigger;
import tuxkids.tuxblocks.core.utils.Debug;

abstract class FSMTutorial implements TutorialInstance {

	private static int layerColor;
	protected final FSMState anyState = new FSMState();
	protected final FSMState endState = new FSMState();

	private FSMState startState = null;	
	private TutorialLayer layer;
	private FSMState currentState = startState;
	private Json.Object messages;
	protected StoryGameState gameState;
	private static final Object NO_EXTRA_INFO = new Object();
	
	protected abstract void setUpStates();
	
	public FSMTutorial(StoryGameState storyGameState) {
		layer = new TutorialLayer(layerColor);
		this.gameState = storyGameState;
	}
	
	protected FSMState addStartState(String id) {
		return (startState = addState(id));
	}
	
	protected FSMState addStartState(String id, FSMState baseState) {
		return (startState = addState(id, baseState));
	}
	
	/**
	 * Convenience method to add a standard FSM state with text belonging to the
	 * given id.
	 * @param id
	 * @return
	 */
	protected FSMState addState(String id) {
		return addState(id, new FSMState());
	}
	
	protected FSMState addState(String idOfText, FSMState baseState) {
		String text = messages.getString(idOfText);
		if (text == null) {
			Debug.write("WARNING: no such tutorial text with id: " + idOfText);
			text = "";
		}
		text = Tutorial.prepareMessage(text);
		baseState.setMessage(text);
		return baseState;
	}
	
	@Override
	public void loadTextFile(String result) {
		messages = PlayN.json().parse(result);
		setUpStates();
		if (startState == null) {
			throw new RuntimeException("Must call addStartState()");
		}
		currentState = startState;
		if (currentState.message != null) layer.showMessage(currentState.message);
	}

	@Override
	public void paint(Clock clock) {
		layer.paint(clock);
	}

	@Override
	public void update(int delta) { }

	@Override
	public void trigger(Trigger event) {
		this.trigger(event, NO_EXTRA_INFO);
	}
	
	@Override
	public void trigger(Trigger event, Object extraInformation) {
		if (currentState == endState || currentState == null) return;
		
		FSMState nextState = currentState.sawTrigger(event, extraInformation);
		
		if (nextState != null) {
			currentState = nextState;
			refreshHighlights();
			if (currentState.message != null) layer.showMessage(currentState.message);
			currentState = currentState.notifyMessageShown();
			refreshHighlights();
		}
		if (nextState == endState) {
			endOfTutorial();
		}
	}

	protected void endOfTutorial() {
		destroy();
	}
	
	

	@Override
	public void destroy() {
		layer.destroy();
	}

	@Override
	public void refreshHighlights() {
		if (currentState != null)
			Tutorial.refreshHighlights(this.currentState.highlightables); //TODO: correct list
	}

	@Override
	public void didLeaveScreen() {
		// screen left; message can possible be reshown
	}
	
	@Override
	public void wasRepeated() {
		// repeat button pressed, message reshown
	}
	
	public static void setPrimaryColor(int primaryColor) {
		layerColor = primaryColor;
	}

	/**
	 * Allows a transition (given a trigger) to go to one of many states depending on
	 * additional information passed in (by other game parts)
	 *
	 */
	protected interface StateChooser {
		FSMState chooseState(Object extraInformation);	
	}
	
	private class DefaultStateChooser implements StateChooser {
		private FSMState state;

		public DefaultStateChooser(FSMState state) {
			this.state = state;
		}

		@Override
		public FSMState chooseState(Object extraInformation) {
			return state;
		}
		
	}
	
	protected class FSMState {
		public String message = null;
		public final List<Tag> highlightables = new ArrayList<Tag>(2);
		private final HashMap<Trigger, StateChooser> transitions = new HashMap<Trigger, StateChooser>();
		private FSMState elseState;
		private FSMState epsilonState;

		private final void setMessage(String text) {
			this.message = text;
		}

		//shouldn't need to override this.  override notifyMessageShown() if you want to perform
		//an action after the message was shown.
		private final FSMState sawTrigger(Trigger trigger, Object extraInformation) {
			StateChooser nextState = transitions.get(trigger);
			if (nextState != null) {
				return nextState.chooseState(extraInformation);
			} else if (nextState == null && elseState == null && anyState.transitions.containsKey(trigger)) {
				return anyState.transitions.get(trigger).chooseState(extraInformation);
			}
			return elseState; 
		}
		
		

		public final FSMState addHighlightable(Tag highlightable) {
			highlightables.add(highlightable);
			return this;
		}
		
		public final FSMState addTransition(FSMState state, Trigger... triggers) {
			for(Trigger t: triggers) {
				StateChooser sc = transitions.get(t);
				if (sc == null) {
					transitions.put(t, new DefaultStateChooser(state));
				} else {
					Debug.write("Warning: Multiple states from this trigger.  Make a stateChooser instead.");
				}
			}
			return this;
		}
		
		public final FSMState addTransition(StateChooser stateChooser, Trigger trigger) {
			StateChooser sc = transitions.get(trigger);
			if (sc == null) {
				transitions.put(trigger, stateChooser);
			}
			else {
				Debug.write("You can't chain stateChoosers.  Make one combined stateChooser per action/trigger");
			}
	
			return this;
		}
		
		
		public final FSMState registerElseTransition(FSMState state) {
			this.elseState = state;
			return this;
		}

		public final void registerEpsilonTransition(FSMState epsilonState) {
			if (this.epsilonState == null) {
				this.epsilonState = epsilonState;
			} else {
				Debug.write("You can only register one epsilon state");
			}
		}
		
		/**
		 * Allows this state to update after its message has been shown.
		 * 
		 * The default implementation is an epsilon transition (if one has 
		 * been registered), but subclasses could do things like trigger UI events
		 * @return
		 */
		public FSMState notifyMessageShown() {
			if (this.epsilonState == null) {
				return this;
			}
			Debug.write("Epsilon transition to "+epsilonState);
			return epsilonState;
		}
	}

}