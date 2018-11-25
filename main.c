// Constants for framebuffer colors
#define FB_RED 4
#define FB_WHITE 15

void fb_write_cell(unsigned int i, char c[], unsigned char fg, unsigned char bg){
    char key = c[i];

    if(key != 0){
      char *fb = (char *)0x000B8000;
      fb[i*2] = key;
      fb[i*2+1] = ((fg & 0x0F) << 4) | (bg & 0x0F);
      // move to next position
      i++;
      fb_write_cell(i, c, fg, bg);
    }
}


int main(){
    // Starting address for framebuffer
    // char *fb = (char *)0x000B8000;
    // fb[0] = 'A';
    // fb[1] = 0x28;
    char str[] = "WARNING";
    fb_write_cell(0, str, FB_WHITE, FB_RED);
    return 0;
}
