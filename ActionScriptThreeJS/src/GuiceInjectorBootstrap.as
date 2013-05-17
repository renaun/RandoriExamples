package {
import guice.GuiceJs;
import guice.InjectionClassBuilder;
import guice.Injector;
import guice.loader.SynchronousClassLoader;
import guice.loader.URLRewriterBase;

import randori.webkit.xml.XMLHttpRequest;

public class GuiceInjectorBootstrap {

	private var mainClassName:String;
	private var dynamicClassBaseUrl:String;

	public function launch():void {
		var urlRewriter:URLRewriterBase = new URLRewriterBase();
		var loader:SynchronousClassLoader = new SynchronousClassLoader( new XMLHttpRequest(), urlRewriter, dynamicClassBaseUrl );
		var guiceJs:GuiceJs = new GuiceJs( loader );
		var injector:Injector = guiceJs.createInjector( null );
		var classBuilder:InjectionClassBuilder = injector.getInstance( InjectionClassBuilder ) as InjectionClassBuilder;

		var obj:* = classBuilder.buildClass( mainClassName );
		obj.main();
	}

	public function GuiceInjectorBootstrap( mainClassName:String, dynamicClassBaseUrl:String ) {
		this.mainClassName = mainClassName;
		this.dynamicClassBaseUrl = dynamicClassBaseUrl;
	}
}
}