# Docker compass for foundation 5.5.0

A Docker image with compass to compile .scss files using foundation-5-5 without globals are repeated multiple times

##Requirement

You need to patch the file foundation/scss/foundation/_functions.scss

```javascript
@mixin exports($name) {
  // Import from global scope
  $modules: $modules;
  // Check if a module is already on the list
  $module_index: index($modules, $name);
  @if (($module_index == null) or ($module_index == false)) {
    $modules: append($modules, $name) !global;
    @content;
  }
}
```

According to the several threads:

- http://foundation.zurb.com/forum/posts/19189-globals-are-repeated-multiple-times
- http://foundation.zurb.com/forum/posts/25911-duplicate-styles--huge-css-file
- http://foundation.zurb.com/forum/posts/20340-repeating-global-styles-when-updating
- ...

##Use
```
docker run -v $ABSOLUTE_BASE_PATH:/src 64b380bf25bc compile $RELATIVE_RB_PATH
```
- $ABSOLUTE_BASE_PATH: Define the local working directory
- $RELATIVE_RB_PATH: Define the path to config.rb file (used with $ABSOLUTE_BASE_PATH when you have dependecies in scss files)

###Sample
```
docker run -v /var/www/magento/skin/frontend:/src 64b380bf25bc compile ./default/default
```

_Folder structure_:

    /var/www/magento/skin/frontend
                              /default
                                /default
                                  /css
                                  /scss
                                  config.rb
                              /polar
                                /default
                                  /foundation
                                  /css
                                  /scss
                                  config.rb
