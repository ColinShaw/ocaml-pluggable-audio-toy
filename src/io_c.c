#include <ao/ao.h>
#include <mpg123.h>
#include <caml/signals.h>
#include <caml/memory.h>
#include <caml/mlvalues.h>


int driver;
ao_device *dev;
ao_sample_format format;


void init_ao() {
    ao_initialize();
    driver = ao_default_driver_id();
    format.bits = mpg123_encsize(encoding) * BITS;
    format.rate = rate;
    format.channels = channels;
    format.byte_format = AO_FMT_NATIVE;
    format.matrix = 0;
    dev = ao_open_live(driver, &format, NULL);


}

void init_mp3() {
    mpg123_init();
    mh = mpg123_new(NULL, &err);
    buffer_size = mpg123_outblock(mh);
    buffer = (unsigned char*) malloc(buffer_size * sizeof(unsigned char));
    mpg123_open(mh, argv[1]);
    mpg123_getformat(mh, &rate, &channels, &encoding);
}

CAMLprim init() {
    init_mp3();
    init_ao();
}

void kill_ao() {
    free(buffer);
    ao_close(dev);
    ao_shutdown();
}

void kill_mp3() {
    mpg123_close(mh);
    mpg123_delete(mh);
    mpg123_exit();
}

CAMLprim kill() {
    kill_mp3();
    kill_ao();
}
