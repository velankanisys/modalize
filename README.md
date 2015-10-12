Modalize
========================

Seamless, reactive and template-based modals for [Materialize](http://materializecss.com).  This is a radically modified fork of the very useful [meteorstuff:materialize-modal](https://github.com/MeteorStuff/meteor-materialize-modal) package, started by [*@pfafman*](https://github.com/pfafman).  If you don't want (or need) the full Meteoric event maps or fine-tuned modal control this package offers, you should check it out!

This package seeks to provide the following solutions:

*  Simple execution: Just pass template names, and let Materialize handle the rendering!
*  Full extensibility:  Write full, detailed Meteoric event maps to fully control your modals behaviour!  No messy callbacks.
*  Convenient configuration:  Provides easy-to-use modal body & footer helpers that make it easy to implement great-looking full screen and fixed footer style modals.
*  Robust events:  Modal templates have access to all the events contained in the modal, including custom events such as `dismissed`, which is fired when the user exits a modal by clicking away from it.
*  Natural Materialize integration:  Modalize is directly accessible from the `Materialize` object: `Materialize.modalize.display()`, `Materialize.modalize.close()`, etc.

## Install

```bash
meteor add msolters:modalize
```

## Usage

```
	Materialize.modalize.display( options={} ); // display a modal
	Materialize.modalize.close();	// dismiss current modal
```

## Options

* template - The template to be rendered as a modal.  (Required)
* title - Modal title. Can have HTML markup.  (Optional)
* dismiss - (bool) false if you want to override the default modal dismissal behaviour.  (Optional)
* fixedFooter - (bool) true if you want to use a [fixed footer](http://materializecss.com/modals.html#fixed-footer).  Recommended for fullScreen & bottomSheet modals.  (Optional)
* bottomSheet - (bool) If you want a bottom sheet modal.  (Optional)
* fullScreen - (bool) Modal takes up all the full screen.  (Optional)

## Examples
For examples and interactive previews, [check out the demo site](http://modalize.meteor.com)!

## Notes
This package depends on and automatically includes the [materialize:materialize](https://atmospherejs.com/materialize/materialize) package.

## License
MIT
