package tuxkids.tuxblocks.core.layers;

import playn.core.GroupLayer;
import playn.core.Layer;
import playn.core.Pointer.Listener;
import pythagoras.f.Point;
import tripleplay.util.Colors;
import tuxkids.tuxblocks.core.utils.PlayNObject;

/**
 * Default implementation for a {@link LayerLike} which simply
 * wraps the functionality of the provided {@link Layer}. This allows
 * actual Layers to be passed as parameters to function that require a LayerLike.
 */
public class LayerWrapper extends PlayNObject implements LayerLike {
	private Layer layer;
	
	public LayerWrapper(Layer layer) {
		this.layer = layer;
	}
	
	/**
	 * Because this is not actually a {@link Layer}, you must pass this
	 * as the parameter to methods such as {@link GroupLayer#add(Layer)}.
	 */
	@Override
	public Layer layerAddable() {
		return layer;
	}
	
	/**
	 * Adds the {@link LayerWrapper#layerAddable()} to the given GroupLayer.
	 */
	@Override
	public void addToLayer(GroupLayer layer) {
		layer.add(layerAddable());
	}
	
	@Override
	public void setDepth(float depth) {
		layer.setDepth(depth);
	}

	@Override
	public void setTranslation(float x, float y) {
		layer.setTranslation(x, y);
	}

	@Override
	public void setVisible(boolean visible) {
		layer.setVisible(visible);
	}

	@Override
	public void setTint(int tint) {
		layer.setTint(tint);
	}

	/**
	 * Sets the tint of this ImageLayer as the combination of baseColor
	 * and tintColor with the given percent tinted. 
	 */
	@Override
	public void setTint(int baseColor, int tintColor, float perc) {
		setTint(Colors.blend(baseColor, tintColor, perc));
	}

	@Override
	public void addListener(Listener pointerListener) {
		layer.addListener(pointerListener);
	}

	@Override
	public float tx() {
		return layer.tx();
	}

	@Override
	public float ty() {
		return layer.ty();
	}

	@Override
	public void setInteractive(boolean interactive) {
		layer.setInteractive(interactive);
	}
	

	@Override
	public GroupLayer parent() {
		return layer.parent();
	}

	@Override
	public float depth() {
		return layer.depth();
	}

	@Override
	public void setOrigin(float x, float y) {
		layer.setOrigin(x, y);
	}

	@Override
	public void setAlpha(float alpha) {
		layer.setAlpha(alpha);
	}
	
	@Override
	public float alpha() {
		return layer.alpha();
	}
	
	public boolean visible() {
		return layer.visible();
	}

	public float originX() {
		return layer.originX();
	}
	
	public float originY() {
		return layer.originY();
	}
	
	public float rotation() {
		return layer.rotation();
	}

	@Override
	public void setTx(float tx) {
		layer.setTx(tx);
	}
	
	@Override
	public void setTy(float ty) {
		layer.setTy(ty);
	}
	
	public void setScale(float scale) {
		setScale(scale, scale);
	}
	
	public void setScale(float scaleX, float scaleY) {
		layer.setScale(scaleX, scaleY);
	}
	
	public void setRotation(float angle) {
		layer.setRotation(angle);
	}
	
	public void destroy() {
		layer.destroy();
	}

	@Override
	public boolean destroyed() {
		return layer.destroyed();
	}

	@Override
	public Layer hitTest(Point p) {
		return layer.hitTest(p);
	}

	@Override
	public boolean incorporatesLayer(Layer hit) {
		if (layer instanceof GroupLayer) {
			GroupLayer groupLayer = (GroupLayer) layer;
			for (int i = 0; i < groupLayer.size(); i++) {
				if (groupLayer.get(i) == hit) return true;
			}
		}
		return hit == layer;
	}
}
