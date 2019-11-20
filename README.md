# gitolite-to-gitlab
This is a basic script that helps you transfer all your repositories from gitolite to gitlab. Just download it and start it. 

Useage is as followings:
GITOLITE GITLAB_URL API_TOKEN GITLAB_USER

For example: 
```
sh gitolite-to-gitlab.sh gitolite.mycompany.com gitlab.mycompany.com jfo!nci3é32_fk3 example.eric
```
Big, big, **BIG** thanks to [**Bruno Scheele**] (http://binaryadventures.com/blog/migrating-from-gitolite-to-gitlab/) and his work. I only made it a little simplier.

Troubleshooting:

* Note 1: Make sure you have enough space on the machine you are executing it on because it will clone every repository!
* Note 2: If you want to test first if it can read all your repositories just comment out every line between 23-28 and remove comment form line 20, 21 and 22 and run it.
* Note 3: No need git@ before the links, it will be added by the script.
* Note 4: If you have forward slash in your repository name (like company/project.git) then in the project name forward slash will be replaced by underscore and the folders will be called by the party after the last forward slash.



