WARNING: This has only been tested on my Deluge 1.3.15's instance of the torrents.state file, and as such, you should proceed with caution.

The basic gist of what the script does is it matches lines according to the regular expressions. The following line contains a string we're interested in. It parses the string from the line and then outputs it to a .csv file. As simple as the script is though, given that I have no other practical way of testing it, I would recommend that before using the script, you should check whether the following REGEX return five lines of sample information.
```
grep -n -m 5 '^sg25$' torrents.state
grep -n -m 5 '^asg18$' torrents.state
grep -n -m 5 '^sg21$' torrents.state
```
The sample output should look something like this.
```
917:sg21
1766:sg21
2741:sg21
3588:sg21
4254:sg21
```


