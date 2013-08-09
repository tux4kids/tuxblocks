package tuxkids.tuxblocks.core.tutorial;

import java.util.ArrayList;
import java.util.List;

import playn.core.GroupLayer;
import playn.core.ImageLayer;
import playn.core.Pointer.Event;
import playn.core.Pointer.Listener;
import playn.core.util.Clock;
import tripleplay.util.Colors;
import tuxkids.tuxblocks.core.Button;
import tuxkids.tuxblocks.core.Button.OnReleasedListener;
import tuxkids.tuxblocks.core.Constant;
import tuxkids.tuxblocks.core.MenuLayer;
import tuxkids.tuxblocks.core.layers.LayerWrapper;
import tuxkids.tuxblocks.core.tutorial.Tutorial.Action;
import tuxkids.tuxblocks.core.tutorial.Tutorial.Indicator;
import tuxkids.tuxblocks.core.utils.CanvasUtils;

public class TutorialLayer extends LayerWrapper implements Listener {

	protected final GroupLayer layer;
	protected final float width, height;
	protected final ImageLayer touchCatcher;
	protected final TextBoxLayer textBox; 
	protected final Button buttonRepeat;
	protected final int themeColor;
	
	protected List<IndicatorLayer> indicators = new ArrayList<IndicatorLayer>();
	
	public TutorialLayer(int themeColor) {
		super(graphics().createGroupLayer());
		layer = (GroupLayer) layerAddable();
		width = graphics().width();
		height = graphics().height();
		this.themeColor = themeColor;
		setDepth(1000);
		graphics().rootLayer().add(layer);
		
		textBox = new TextBoxLayer(width * 0.85f);
		textBox.setTranslation(width * 0.1f, height * 0.90f);
		textBox.setDepth(1);
		layer.add(textBox.layerAddable());
		
		touchCatcher = graphics().createImageLayer(CanvasUtils.createRect(1, 1, CanvasUtils.TRANSPARENT));
		touchCatcher.setDepth(10);
		touchCatcher.setSize(width, height);
		touchCatcher.addListener(this);
		touchCatcher.setVisible(false);
		layer.add(touchCatcher);
		
		
		float size = MenuLayer.defaultButtonSize() * 0.7f;
		buttonRepeat = new Button(Constant.BUTTON_RESET, size, size, true);
		buttonRepeat.setPosition(width / 2, height - buttonRepeat.height() * 0.75f);
		buttonRepeat.layerAddable().setDepth(touchCatcher.depth() + 1);
		buttonRepeat.setTint(Colors.LIGHT_GRAY, 0.4f);
		layer.add(buttonRepeat.layerAddable());
		
		buttonRepeat.setOnReleasedListener(new OnReleasedListener() {
			@Override
			public void onRelease(Event event, boolean inButton) {
				if (inButton) {
					repeatMessage();
				}
			}
		});
	}

	public void clearIndicators() {
		for (IndicatorLayer indicator : indicators) {
			indicator.clear();
		}
	}

	public void showAction(Action action) {
		showMessage(action.message);
		clearIndicators();
		int index = 0;
		for (final Indicator indicator : action.indicators) {
			if (indicators.size() == index) {
				IndicatorLayer indicatorLayer = new IndicatorLayer();
				indicators.add(indicatorLayer);
				layer.add(indicatorLayer.layerAddable());
			}
			
			IndicatorLayer indicatorLayer = indicators.get(index);
			indicatorLayer.set(indicator, themeColor);
			indicatorLayer.setVisible(true);
			index++;
		}
	}
	
	public void showMessage(String text) {
		textBox.show(text);
		touchCatcher.setVisible(true);
	}
	
	public void repeatMessage() {
		textBox.show(null);
		touchCatcher.setVisible(true);
	}
	
	public void paint(Clock clock) {
		textBox.paint(clock);
		for (IndicatorLayer layer : indicators) {
			if (layer.isSet()) {
				lerpAlpha(layer, 1, 0.99f, clock.dt());
			} else if (layer.visible()) {
				lerpAlpha(layer, 0, 0.99f, clock.dt());
				if (layer.alpha() == 0) layer.setVisible(false);
			}
		}
	}

	@Override
	public void onPointerStart(Event event) {
		textBox.hide();
		touchCatcher.setVisible(false);
	}

	@Override
	public void onPointerEnd(Event event) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void onPointerDrag(Event event) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void onPointerCancel(Event event) {
		// TODO Auto-generated method stub
		
	}

}
