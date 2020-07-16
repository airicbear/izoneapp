# IZ*ONE Fan App <img src="./assets/launcher_round.png" width="64" alt="App icon"/>

A fan-made Flutter app dedicated to [IZ*ONE](http://iz-one.co.kr/).

## Resources

- Data:
    - https://dbkpop.com/group/izone
    - https://www.izone-official.com
- Pictures: http://iz-one.co.kr/photos/

## Developer Notes

### App and repository size

The app and repository size may be quite large due to the high quality images in the `assets/images` folder.
Somethings to consider may include image compression, fetching images using networking, or allowing the user to download more pictures into local storage while keeping a default gallery in the repository.

### Database

I initially tried using SQLite hence the `assets/izoneapp.db` but then exported it to `assets/izone.json` after realizing how much easier it would be to just use JSON.
I'm keeping this method of editing the `.db` file and exporting to `.json` in case I want to use SQL in the future.
