<?php
use Roots\Sage\Assets;

add_action('wp_enqueue_scripts', 'theme_enqueue_styles');
add_action('wp_enqueue_scripts', 'theme_enqueue_scripts');
function theme_enqueue_styles() {
  $uri = Assets\asset_path('astrum-education/dist/scripts/main.css');
  $uri = str_replace('/astrum-education-base/dist/','/', $uri);

  wp_enqueue_style('astrum-education/css', $uri, ['sage/css'], null);
}

function theme_enqueue_scripts(){
  $uri = Assets\asset_path('astrum-education/dist/scripts/main.js');
  $uri = str_replace('/astrum-education-base/dist/','/', $uri);

  wp_enqueue_script('astrum-education/js', $uri, ['jquery'], null, true);
}
