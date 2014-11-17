package mithril;
import js.html.Element;

typedef Module = {
	function controller() : Dynamic;
	function view() : VirtualElement;
}

typedef GetterSetter = Dynamic;

extern class VirtualElement {}
extern class EventHandler {}

//@:native('m')
class M
{
	public static var modules = new List<Module>();

	public static function m(selector : String, ?attributes : Dynamic, ?children : Dynamic) : VirtualElement
	{
		if (attributes != null && children != null)
			return untyped __js__("Mithril(selector, attributes, children)");
		else if(attributes != null)
			return untyped __js__("Mithril(selector, attributes)");
		else
			return untyped __js__("Mithril(selector)");
	}

	public static function module(element : Element, module : Module) : Dynamic
	{
		modules.push(module);
		return untyped __js__("Mithril.module(element, module)");
	}

	public static function prop<T>(initialValue : T) : GetterSetter
	{
		return untyped __js__("Mithril.prop(initialValue)");
	}

	public static function withAttr(property : String, ?callback : Dynamic) : EventHandler
	{
		return untyped __js__("Mithril.withAttr(property, callback)");
	}
}
