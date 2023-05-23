#!/bin/bash
yabai_get_current_space(){
  yabai -m query --spaces --space | jq '.index'
}

yabai_get_windows_for_current_space(){
  yabai -m query --windows --space $(yabai_get_current_space) 
}
