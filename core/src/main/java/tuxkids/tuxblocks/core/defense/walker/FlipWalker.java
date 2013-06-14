package tuxkids.tuxblocks.core.defense.walker;

import pythagoras.f.Vector;
import pythagoras.i.Point;
import tuxkids.tuxblocks.core.defense.Grid;

public abstract class FlipWalker extends Walker {
	@Override
	protected void updateMovement(float perc) {
		int dx = -(coordinates.y - lastCoordinates.y);
		int dy = -(coordinates.x - lastCoordinates.x);

		float x = Math.max(coordinates.y, lastCoordinates.y) * grid.getCellSize();
		float y = Math.max(coordinates.x, lastCoordinates.x) * grid.getCellSize();
		
		sprite.setTranslation(x, y);
		
		float scaleX = dx * (float)Math.cos(Math.PI * perc);
		if (dx == 0) scaleX = 1;
		float scaleY = dy * (float)Math.cos(Math.PI * perc);
		if (dy == 0) scaleY = 1;
		
		sprite.setScale(scaleX, scaleY);
	}

}
