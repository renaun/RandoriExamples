/***
 *	Author: Renaun Erickson (renaun.com - @renaun - github.com/renaun)
 * 	
 * 	Attribution: Leonard Souza - https://github.com/leonardsouza/RandoriAS-ThreeJS
 */
package
{
import com.mrdoob.stats.Stats;
import com.mrdoob.three.Three;
import com.mrdoob.three.cameras.PerspectiveCamera;
import com.mrdoob.three.extras.geometries.CubeGeometry;
import com.mrdoob.three.extras.geometries.PlaneGeometry;
import com.mrdoob.three.loaders.ImageUtils;
import com.mrdoob.three.materials.MeshBasicMaterial;
import com.mrdoob.three.math.Matrix4;
import com.mrdoob.three.math.Plane;
import com.mrdoob.three.objects.Mesh;
import com.mrdoob.three.renderers.WebGLRenderer;
import com.mrdoob.three.scenes.Scene;
import com.mrdoob.three.textures.Texture;

import randori.webkit.dom.DomEvent;
import randori.webkit.dom.Element;
import randori.webkit.dom.MouseEvent;
import randori.webkit.dom.TouchEvent;
import randori.webkit.html.HTMLDivElement;
import randori.webkit.html.HTMLElement;
import randori.webkit.page.Window;

import utils.RequestAnimationFrame;

public class ActionScriptThreeJS
{	
	protected var container:Element;
	protected var stats:Stats;
	
	protected var camera:PerspectiveCamera;
	protected var scene:Scene;
	protected var renderer:WebGLRenderer;
	
	protected var cube:Mesh;
	protected var plane:Plane;
	
	protected var targetRotation:Number = 0;
	protected var targetRotationOnMouseDown:Number = 0;
	
	protected var mouseX:Number = 0;
	protected var mouseXOnMouseDown:Number = 0;
	protected var windowHalfX:Number = window.innerWidth / 2;
	protected var windowHalfY:Number = window.innerHeight / 2;
	
	[Inject]
	public var animation:RequestAnimationFrame;
	
	public function main():void
	{		
		container = new HTMLDivElement();
		window.document.body.appendChild(container);
		
		var info:HTMLElement = new HTMLDivElement();
		info.style.position ="absolute;"
		info.style.top ="10px";
		info.style.width ="100%";
		info.style.textAlign ="center";
		info.innerHTML ="Drag to spin the cube";
		container.appendChild(info);
		
		camera = new PerspectiveCamera(45, window.innerWidth / window.innerHeight, 1, 2000);
		camera.position.y = 150;
		camera.position.z = 600;
		
		scene = new Scene();
		
		// FLOOR
		var floorTexture:Texture = ImageUtils.loadTexture("images/checkerboard.jpg");
		floorTexture.wrapS = floorTexture.wrapT = Three.RepeatWrapping; 
		floorTexture.repeat.set(5, 5);
		var floorMaterial:MeshBasicMaterial = new MeshBasicMaterial({ map: floorTexture, side: Three.DoubleSide });
		var floorGeometry:PlaneGeometry = new PlaneGeometry(1200, 1200, 20, 20);
		var floor:Mesh = new Mesh(floorGeometry, floorMaterial);
		floor.position.y = -0.5;
		floor.rotation.x = Math.PI / 2;
		floor.position.z = -10;
		scene.add(floor);
		
		// Cube
		var geometry:CubeGeometry = new CubeGeometry(200, 200, 200);
		for (var i:int = 0; i < geometry.faces.length; i ++)
			geometry.faces[i].color.setHex(Math.random() * 0xffffff);
		var material:MeshBasicMaterial = new MeshBasicMaterial({ vertexColors: Three.FaceColors });
		cube = new Mesh(geometry, material);
		cube.position.y = 150;
		scene.add(cube);
		
		// Plane
		var geometry2:PlaneGeometry = new PlaneGeometry(200, 200);
		geometry2.applyMatrix(new Matrix4().makeRotationX(- Math.PI / 2 ));
		material = new MeshBasicMaterial({ color: 0xe0e0e0 });
		plane = new Mesh(geometry2, material) as Plane;
		scene.add(plane);
		
		renderer = new WebGLRenderer( {antialias:true} );
		renderer.setSize(window.innerWidth, window.innerHeight);
		
		container.appendChild(renderer.domElement);
		
		stats = new Stats();
		stats.domElement.style.position ="absolute";
		stats.domElement.style.top ="0px";
		container.appendChild(stats.domElement);
		
		window.document.addEventListener("mousedown", onDocumentMouseDown, false);
		window.document.addEventListener("touchstart", onDocumentTouchStart, false);
		window.document.addEventListener("touchmove", onDocumentTouchMove, false);
		
		window.addEventListener("resize", onWindowResize, false);
		
		startRender();
	}
	
	
	private function onDocumentMouseDown(event:MouseEvent):void
	{
		event.preventDefault();
		
		window.console.log("down");
		window.document.addEventListener("mousemove", onDocumentMouseMove, false);
		window.document.addEventListener("mouseup", onDocumentMouseUp, false);
		window.document.addEventListener("mouseout", onDocumentMouseOut, false);
		
		mouseXOnMouseDown = event.clientX - windowHalfX;
		targetRotationOnMouseDown = targetRotation;
	}
	
	private function onDocumentTouchStart(event:TouchEvent):void
	{
		if (event.touches.length === 1) {
			
			event.preventDefault();
			
			mouseXOnMouseDown = event.touches[0].pageX - windowHalfX;
			targetRotationOnMouseDown = targetRotation;
		}
	}
	
	private function onDocumentTouchMove(event:TouchEvent):void
	{
		if (event.touches.length === 1) {
			
			event.preventDefault();
			
			mouseX = event.touches[0].pageX - windowHalfX;
			targetRotation = targetRotationOnMouseDown + (mouseX - mouseXOnMouseDown) * 0.05;
			window.console.log("touchMove");
		}
	}
	
	private function onDocumentMouseMove(event:MouseEvent):void
	{
		mouseX = event.clientX - windowHalfX;
		targetRotation = targetRotationOnMouseDown + (mouseX - mouseXOnMouseDown ) * 0.02;
	}
	
	private function onDocumentMouseUp(event:MouseEvent):void
	{
		window.console.log("up");		
		window.document.removeEventListener("mousemove", onDocumentMouseMove, false);
		window.document.removeEventListener("mouseup", onDocumentMouseUp, false);
		window.document.removeEventListener("mouseout", onDocumentMouseOut, false);
	}
	
	private function onDocumentMouseOut(event:MouseEvent):void
	{
		window.console.log("out");
		window.document.removeEventListener("mousemove", onDocumentMouseMove, false);
		window.document.removeEventListener("mouseup", onDocumentMouseUp, false);
		window.document.removeEventListener("mouseout", onDocumentMouseOut, false);
	}
	
	private function onWindowResize(event:DomEvent):void
	{
		windowHalfX = window.innerWidth / 2;
		windowHalfY = window.innerHeight / 2;
		
		camera.aspect = window.innerWidth / window.innerHeight;
		camera.updateProjectionMatrix();
		
		renderer.setSize(window.innerWidth, window.innerHeight);
	}
	
	private function startRender():void
	{
		animation.request(startRender);
		
		render();
		stats.update();
	}
	
	private function render():void
	{
		plane.rotation.y = cube.rotation.y += (targetRotation - cube.rotation.y) * 0.05;
		renderer.render(scene, camera);
	}
}
}