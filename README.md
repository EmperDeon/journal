# Journal

App for storing notes and journal events

Built using [RxVMS](https://www.burkharts.net/apps/blog/) architecture, with small modifications.


## TODO:

- Add focus change to RxTextFieldManager
- Add crypto
- Add Drawer


# Detailed
## Storage

Files:
- util/storage.dart - Storage (Repository)
- util/storable.dart - Simple interface with load/save functions
- util/storable_model.dart - Parent class for root models (objects in Storage)

Order of loading:
- Storage is created
- Storage load is started
- Models constructed, each added self as reloadTarget
- Storage load is finished, Storage sends reload signal
- Each model is reloaded
