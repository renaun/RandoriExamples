package utils
{
import randori.webkit.page.Window;

public class RequestAnimationFrame
{
	
	public function request(callback:Function):void
	{
		var w:* = Window;
		
		var requestAnimationFrame:* =
			w.requestAnimationFrame       ||
			w.webkitRequestAnimationFrame ||
			w.mozRequestAnimationFrame    ||
			w.oRequestAnimationFrame ||
			w.msRequestAnimationFrame ||
			function(callback):void {
				Window.setTimeout(callback, 1000 / 60);
			}
		
		requestAnimationFrame(callback);
	}
	
}
}