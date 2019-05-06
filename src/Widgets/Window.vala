public class Jarvis.Window : Gtk.ApplicationWindow {
	public GLib.Settings settings;
	public Gtk.Stack stack { get; set; }

	public Window (Application app) {
		Object (
			application: app
		);
	}

	construct {
	 	window_position = Gtk.WindowPosition.CENTER;
	 	set_default_size (350, 80);

	 	settings = new GLib.Settings ("com.github.alecaddd.jarvis");

	 	move (settings.get_int ("pos-x"), settings.get_int ("pos-y"));
	 	resize (settings.get_int ("window-width"), settings.get_int ("window-height"));

	 	delete_event.connect (e => {
	 		return before_destroy ();
	 	});

	 	stack = new Gtk.Stack ();
	 	stack.expand = true;

	 	var outstanding = new Gtk.Grid ();
		outstanding.add (new Gtk.Label ("Outstanding Page"));
		var completed = new Gtk.Grid ();
		completed.add (new Gtk.Label ("Completed Page"));

		stack.add_titled (outstanding, "outstanding", "Outstanding");
		stack.add_titled (completed, "completed", "Completed");

		add (stack);

	 	var headerbar = new Jarvis.HeaderBar (this);
	 	set_titlebar (headerbar);

	 	show_all ();
	}

	public bool before_destroy () {
		int width, height, x, y;

		get_size (out width, out height);
		get_position (out x, out y);

		settings.set_int ("pos-x", x);
		settings.set_int ("pos-y", y);
		settings.set_int ("window-width", width);
		settings.set_int ("window-height", height);

		return false;
	}
}
