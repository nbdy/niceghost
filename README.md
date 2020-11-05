# niceghost
## niceg(uest)host
```
cuckoo is python2
porting to python3 is hard
so i'm trying to create a new solution
```
### features
- Web UI
    - [ ] Dashboard
        - [X] list vm's as table
        - [X] search vm in table
        - [X] charts
        - [X] start/stop/restart vm
        - [ ] configure vm
        - [ ] upload and execute file
            - [ ] cuckoo's procmon?
            - [ ] screenshots
            - [ ] behavoiral analysis
    - [ ] KVM Settings
        - [ ] Change them

### setup
```shell script
sudo apt install -y postgres virt-manager
# { postgres setup here }
# { vm setup here }

bundle install

rails db:setup
rails db:migrate
```

### running
```shell script
rails runserver
```