# Hubzilla Plugins

[Hubzilla](http://hubzilla.org) is a powerful platform for creating interconnected websites featuring a decentralized identity, communications, and permissions framework built using common webserver technology. 

This is a repository of **plugins** (also known as **addons**) that extend the functionality of the core Hubzilla installation in various ways.

### Installation


To install, use the following commands (assuming `/var/www/` is your hub's web root):

```
cd /var/www/
util/add_addon_repo https://gitlab.com/zot/hubzilla-plugins.git plugins
util/update_addon_repo plugins
```
Then enable the individual plugins through the admin settings interface.

## Plugins
### Embed Photos
Adds a button to the post editor that lets you browse album galleries and select linked images to embed in the post.