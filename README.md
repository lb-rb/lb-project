[gem]: https://rubygems.org/gems/lb-project
[gemnasium]: https://gemnasium.com/lb-rb/lb-project
[roda]: http://roda.jeremyevans.net/
[dry-view]: http://dry-rb.org/gems/dry-view/

# lb-project

[![Gem Version](https://badge.fury.io/rb/lb-project.svg)][gem]
[![Dependency Status](https://gemnasium.com/lb-rb/lb-project.svg)][gemnasium]

This static site builder allows an easy migration to a dynamic site. In many
projects it is unclear if or when a static site has to be migrated to a dynamic
one. Maintaining a static site is less work, so we want to keep it static until
the point is reached, where we have to migrate the project to a full dynamic
stack.

The target of lb-project is to minimize this migration effort. We use
[Roda][roda] and [dry-view][dry-view] because this are currently excellent
solutions that are suited for big projects. This means you can start
lightweight, without worrying that it becomes to small.

## Credits

 * [Firas Zaidan](https://github.com/zaidan)

## License

See `LICENSE` file.
