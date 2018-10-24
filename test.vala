int main (string[] args) {
	Gtk.init (ref args);

	var window = new Gtk.Window ();
	window.title = "This is my Vala Test";
	window.border_width = 10;
	window.window_position = Gtk.WindowPosition.CENTER;
	window.set_default_size (350, 80);

	window.destroy.connect (Gtk.main_quit);

	window.show_all ();

	Gtk.main ();
	return 0;
}
