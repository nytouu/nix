#define CMDLENGTH 128
#define delimiter "  "

static const Block blocks[] = {
/*  command             interval    signal */
    {"bar-record",      0,          2},
    {"bar-song", 		1,          6},
    /* {"bar-kb",      	0,          5}, */
	{"bar-volume",      0,          4},
	{"bar-light",       0,          9},
	{"bar-battery",     10,         7},
	/* {"bar-notif",       0,          3}, */
	/* {"bar-bluetooth",   0,          15}, */
	/* {"bar-internet",    10,         2}, */
	{"bar-clock",       60,         1},
    /* {"bar-calendar",    60,         8}, */
    /* {"bar-power",       0,          26}, */
};
