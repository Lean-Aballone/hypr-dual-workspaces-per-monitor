#include <iostream>
#include <stdexcept>
#include <stdio.h>
#include <string>

using namespace std;

string exec(string command) {
   char buffer[128];
   string result = "";

   // Open pipe to file
   FILE* pipe = popen(command.c_str(), "r");
   if (!pipe) {
      return "popen failed!";
   }

   // read till end of process:
   while (!feof(pipe)) {

      // use buffer to read and add to result
      if (fgets(buffer, 128, pipe) != NULL)
         result += buffer;
   }

   pclose(pipe);
   return result;
}
void changeWs(char, string);
int main() {
   string active_wk = exec("hyprctl activeworkspace | grep -E 'ID' | sed 's/ID//g' |awk '{print $2}'");
   active_wk.pop_back();
   char mon_ID = active_wk.back();
   active_wk.pop_back();
   active_wk.pop_back();
   string workspace_ID = active_wk;
   changeWs(mon_ID,workspace_ID);
   return 0;
}

void changeWs(char mon_ID, string ws_ID){
    switch(mon_ID){
        case '0': //Samsung
            (ws_ID == "4") ? system("hyprctl dispatch workspace 44") : system("hyprctl dispatch workspace 4");
            break;
        case '1': //philips
            (ws_ID == "3") ? system("hyprctl dispatch workspace 33") : system("hyprctl dispatch workspace 3");
            break;
        case '2': //LG
            (ws_ID == "2") ? system("hyprctl dispatch workspace 22") : system("hyprctl dispatch workspace 2");
            break;
        case '3': //SONY
            (ws_ID == "1") ? system("hyprctl dispatch workspace 11") : system("hyprctl dispatch workspace 1");
            break;
        default:
            system("hyprctl dispatch workspace 3");
            break;
    }
}