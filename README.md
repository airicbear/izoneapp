# IZ*ONE Fan App <img src="./assets/launcher_round.png" width="64" alt="App icon"/>

A fan-made Flutter app dedicated to [IZ*ONE](http://iz-one.co.kr/).

## Resources

- Data: https://dbkpop.com/group/izone
- Pictures: http://iz-one.co.kr/photos/

## Developer Notes

### App and repository size

The app and repository size may be quite large due to the high quality images in the `assets/images` folder.
Somethings to consider may include image compression, fetching images using networking, or allowing the user to download more pictures into local storage while keeping a default gallery in the repository.

### Database

I initially tried using SQLite hence the `assets/izoneapp.db` but then exported it to `assets/izone.json` after realizing how much easier it would be to just use JSON.
I'm keeping this method of editing the `.db` file and exporting to `.json` in case I want to use SQL in the future (for example, if Flutter support for SQLite improves).

### Roadmap

The app is pretty boring at its current state, but that's to be expected since I only just started working on it.
A few things I definitely want to have in this app are options to zoom-in on the images as well as a "More info" option for each member.
Later down the line I might want to add a new page listing links to their YouTube videos, social media, etc.
Other nice-to-have things may include a preferences page, multiple themes, and ability to change the pictures depending on the user's preferred era.

For now, I'm not going to release any builds just yet since I think there is a lot more work to do, however it is fairly straightforward to build yourself following [Flutter's Get Started Page](https://flutter.dev/docs/get-started/install).
It should work for Flutter Web too, so if you want to build it for the web make sure to follow the [Web setup](https://flutter.dev/docs/get-started/web).
Flutter Web definitely isn't perfect yet but I find it pretty cool how it mostly "just works" and doesn't require a phone/emulator.
If you're using Linux, Canonical and Google are working together to make [Flutter build as Linux desktop apps](https://ubuntu.com/blog/canonical-enables-linux-desktop-app-support-with-flutter).
