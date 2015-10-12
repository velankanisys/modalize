Modalize
========================

Seamless, reactive and template-based modals for [Materialize](http://materializecss.com).  This is a radically modified fork of the very useful [meteorstuff:materialize-modal](https://github.com/MeteorStuff/meteor-materialize-modal) package, started by [*@pfafman*](https://github.com/pfafman).  If you don't want (or need) full Meteoric event maps or fine-tuned modal control, you should check it out!

This package seeks to provide the following solutions:

*  Simple execution: Just pass template names, and let Materialize handle the rendering!
*  Full extensibility:  Write full, detailed Meteoric event maps to fully control your modals behaviour!  No messy callbacks.
*  Convenient configuration:  Provides easy-to-use modal body & footer helpers that make it easy to implement great-looking full screen and fixed footer style modals.
*  Robust events:  Modal templates have access to all the events contained in the modal, including custom events such as `dismissed`, which is fired when the user exits a modal by clicking away from it.
*  Natural Materialize integration:  Modalize is directly accessible from the `Materialize` object: `Materialize.modalize.display()`, `Materialize.modalize.close()`, etc.

### [Demo & Documentation](http://modalize.meteor.com)

## Install

```bash
meteor add msolters:modalize
```

## Usage

```
	MaterializeModal.[message|alert|error|confirm|prompt|form|loading|progress](options={})
```

### Options

* title - Modal title. Can have HTML markup.  (Optional)
* template - The template to be rendered as a modal.  (Required)
* fixedFooter - (bool) true if you want to use a [fixed footer](http://materializecss.com/modals.html#fixed-footer).  Recommended for fullscreen modals.  (Optional)
* bottomSheet - (bool) If you want a bottom sheet modal.  (Optional)
* fullscreen - (bool) Modal takes up all the full screen.  (Optional)

## UI
You can change the UI by overwriting the CSS.

```
.materialize-modal {
  // See source for all the css vars
}
```

## Examples


To display a modal

```coffeescript

MaterializeModal.display
    title: 'Title'
    message: 'some message'        
```


## Notes

There might be are more undocumented options that need to be documented.  See code.

## License
MIT
