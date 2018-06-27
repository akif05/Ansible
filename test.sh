#!/bin/bash
#set -x

walk() {
   for entry in "$1"/*; do [[ -f "$entry" ]] && echo -e "\nfile: $entry\n" >> $def_file; cat $entry >> $def_file; done
   for entry in "$1"/*; do [[ -d "$entry" ]] && walk "$entry"; done 
}

def_file="/home/vagrant/ansible/Myfile"
dest_dir="/home/vagrant/ansible/nginx_lb"

walk "${dest_dir}"
