package tuxkids.tuxblocks.core.utils;

import playn.core.CanvasImage;
import playn.core.Color;
import playn.core.Image;
import playn.core.PlayN;
import playn.core.TextFormat;
import playn.core.TextLayout;
import tuxkids.tuxblocks.core.PlayNObject;

public class CanvasUtils extends PlayNObject {
	public static CanvasImage createRect(float width, float height, int fillColor, 
			float strokeWidth, int strokeColor) {
		width = (int)width; height = (int)height;
		CanvasImage image = PlayN.graphics().createImage(width, height);
		image.canvas().setFillColor(fillColor);
		image.canvas().fillRect(0, 0, image.width(), image.height());
		if (strokeWidth > 0) {
			image.canvas().setStrokeColor(strokeColor);
			image.canvas().setStrokeWidth(strokeWidth);
			image.canvas().strokeRect(0, 0, width - strokeWidth / 2, 
					height - strokeWidth / 2);
		}
		return image;
	}

	public static CanvasImage createRect(float width, float height, int fillColor) {
		return createRect(width, height, fillColor, 0, 0);
	}

	public static CanvasImage createCircle(float rad, int fillColor, 
			float strokeWidth, int strokeColor) {
		CanvasImage image = PlayN.graphics().createImage(rad * 2, rad * 2);
		image.canvas().setFillColor(fillColor);
		image.canvas().fillCircle(rad, rad, rad);
		if (strokeWidth > 0) {
			image.canvas().setStrokeColor(strokeColor);
			image.canvas().setStrokeWidth(strokeWidth);
			image.canvas().strokeCircle(rad, rad, rad - strokeWidth / 2);
		}
		return image;
	}

	public static CanvasImage createCircle(float rad, int fillColor) {
		return createCircle(rad, fillColor, 0, 0);
	}

	public static CanvasImage createText(String text,
			TextFormat format, int color) {
		TextLayout layout = PlayN.graphics().layoutText(text, format);
		CanvasImage image = PlayN.graphics().createImage(layout.width(), layout.height());
		image.canvas().setFillColor(color);
		image.canvas().fillText(layout, 0, 0);
		return image;
	}

	public static Image tintImage(Image image, int tint) {
		return tintImage(image, tint, 1);
	}
	
	public static Image tintImage(Image image, int tint, float perc) {
		if (!image.isReady()) return null;
		
		int width = (int)image.width(), height = (int)image.height();
		CanvasImage shifted = graphics().createImage(width, height);
		int[] rgb = new int[width * height];
		image.getRgb(0, 0, width, height, rgb, 0, width);
		for (int i = 0; i < rgb.length; i++) {
			rgb[i] = blendAdditive(rgb[i], tint, perc);
		}
		if (pixelSetter != null) {
			pixelSetter.set(shifted, 0, 0, width, height, rgb, 0, width);
		} else {
			shifted.setRgb(0, 0, width, height, rgb, 0, width);
		}
		return shifted;
	}
	
	public static PixelSetter pixelSetter;
	
	public interface PixelSetter {
		public void set(CanvasImage o, int x, int y, int width, int height, int[] rgb, int offset, int scanSize);
	}
	
	public static String colorToString(int c) {
		return Formatter.format("[%d,%d,%d,%d]", Color.alpha(c), Color.red(c), Color.green(c), Color.blue(c));
	}

	public static int blendAdditive(int c1, int c2, float perc) {
		return Color.argb(Math.min(Color.alpha(c1), Color.alpha(c2)),
				255 - Math.min((int)(255 - Color.red(c1) + (255 - Color.red(c2)) * perc), 255),
				255 - Math.min((int)(255 - Color.green(c1) + (255 - Color.green(c2)) * perc), 255),
				255 - Math.min((int)(255 - Color.blue(c1) + (255 - Color.blue(c2)) * perc), 255));
	}
	
	public static int hsvToRgb(float hue, float saturation, float value) {

	    int h = (int)(hue * 6) % 6;
	    float f = hue * 6 - h;
	    float p = value * (1 - saturation);
	    float q = value * (1 - f * saturation);
	    float t = value * (1 - (1 - f) * saturation);

	    switch (h) {
	      case 0: return rgbFloatToInt(value, t, p);
	      case 1: return rgbFloatToInt(q, value, p);
	      case 2: return rgbFloatToInt(p, value, t);
	      case 3: return rgbFloatToInt(p, q, value);
	      case 4: return rgbFloatToInt(t, p, value);
	      case 5: return rgbFloatToInt(value, p, q);
	      default: throw new RuntimeException("Something went wrong when converting from HSV to RGB. Input was " + hue + ", " + saturation + ", " + value);
	    }
	}
	
	private static int rgbFloatToInt(float r, float g, float b) {
		return Color.rgb((int)(255 * r), (int)(255 * g), (int)(255 * b));
	}

	public static Image createString(TextFormat format, String text, int color) {
		TextLayout layout =  graphics().layoutText(text, format);
		CanvasImage image = graphics().createImage(layout.width(), layout.height());
		image.canvas().setFillColor(color);
		image.canvas().fillText(layout, 0, 0);
		return image;
	}
}
