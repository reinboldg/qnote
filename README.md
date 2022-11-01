# qnote

q(uick)note is a simple but efficient script to take easily quick note from the
terminal using all the power of the UNIX shell.

## Prerequisites

- curl

## Setup

For example we setup qnote in a Bash environment.

```
mkdir $HOME/bin
curl -LSso $HOME/bin/qnote https://raw.githubusercontent.com/reinboldg/qnote/master/qnote.sh
chmod 755 $HOME/bin/qnote
```

Edit `~/.bashrc` and/or `~/.bash_profile`

```
export PATH=$HOME/bin:$PATH
export QNOTE_FILE=~/.qnotes.txt
```

## Aliases

qnote can be used as is, but for convenience we can set some shell aliases in
`.bashrc` and/or `.bash_profile`.

```
if [ ! -z $(which qnote 2>> /dev/null) ]
then
  alias n="qnote -d" # Display all notes
  alias nd="qnote -d" # Same as above
  alias nn="qnote -n" # New note
  alias nr="qnote -r" # Remove note
  alias ns="qnote -s" # Search in all notes
  alias nsi="qnote -si" # Same as above case insensitive
  alias t="qnote -s _todo" # Search _todo notes
  alias i="qnote -s _idea" # Search _idea notes
fi
```

## Usage

Add a new note

```
$ nn This is my first note
2022-11-01 12:52:44 This is my first note
```

Add a note with a character usually interpreted by the shell.

```
nn 'This is a #quick note'
2022-11-01 13:00:28 This is a #quick note
```

Display all notes

```
$ n
     1	2022-11-01 12:52:44 This is my first note
     2	2022-11-01 13:00:28 This is a #quick note
```

Remove a note by its line number in the qnotes.txt file

```
$ nr 2
     1	2022-11-01 12:52:44 This is my first note
```

Add a todo note

```
$ nn _todo Clean my room before mother fights me
2022-11-01 13:06:47 _todo Clean my room before mother fights me
$ nn _todo Wash father car
2022-11-01 13:09:17 _todo Wash father car
```

Display todo notes

```
$ t
     2	2022-11-01 13:06:47 _todo Clean my room before mother fights me
     3	2022-11-01 13:09:17 _todo Wash father car
```

Search in all notes

```
$ ns first
     1	2022-11-01 12:52:44 This is my first note
$ ns _todo
     2	2022-11-01 13:06:47 _todo Clean my room before mother fights me
     3	2022-11-01 13:09:17 _todo Wash father car
$ ns 2022-11
     1	2022-11-01 12:52:44 This is my first note
     2	2022-11-01 13:06:47 _todo Clean my room before mother fights me
     3	2022-11-01 13:09:17 _todo Wash father car
```

Search in all notes (case insensitive)

```
$ nsi wash
     3	2022-11-01 13:09:17 _todo Wash father car
```
