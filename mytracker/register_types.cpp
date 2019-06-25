#include "register_types.h"
#if defined(__APPLE__)
#include "ios/GodotMytracker.h"
#endif

void register_mytracker_types() {
#if defined(__APPLE__)
	ClassDB::register_class<GodotMytracker>();
#endif
}

void unregister_mytracker_types() {
}
