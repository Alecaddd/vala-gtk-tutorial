public class Jarvis.Window : Gtk.ApplicationWindow {

	public Window (Application app) {
		Object (
			application: app
		);
	}

	construct {
	 	title = "This is my Vala Test";
	 	window_position = Gtk.WindowPosition.CENTER;
	 	set_default_size (350, 80);

	 	var settings = new GLib.Settings ("com.github.alecaddd.jarvis");

	 	move (settings.get_int ("pos-x"), settings.get_int ("pos-y"));

	 	show_all ();
	}
}
