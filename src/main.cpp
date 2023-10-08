#include "pico/stdlib.h"

int main() {
    const uint LED_PIN = PICO_DEFAULT_LED_PIN;
    gpio_init(LED_PIN);
    gpio_set_dir(LED_PIN, GPIO_OUT);

    bool led_output = false;
    while(true) {
        gpio_put(LED_PIN, !led_output ? 1 : 0);
        led_output = !led_output;
        sleep_ms(500);
    }
}
