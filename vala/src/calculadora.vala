const string GETTEXT_PACKAGE = "_";

namespace Config{
    public const string DEVELOPMENT_MODE = "ON";
    public const string GETTEXT_PACKAGE = "initapp";
    public const string PACKAGE_LOCALE_DIR = "/usr/local/share/locale/";
    public const string PROJECT_DIR = "/mnt/d/ua/4/1cuatri/dca/practica8/vala";
}

class Demo.Calculadora : GLib.Object {
    public static int main(string[] args) {
        string localedir;
        if (Config.DEVELOPMENT_MODE == "ON") {
            localedir = "src/po";
        } else {
            localedir = Config.PACKAGE_LOCALE_DIR;
        }
        Intl.setlocale (LocaleCategory.MESSAGES, "");

        Intl.bindtextdomain (Config.GETTEXT_PACKAGE, localedir);
        Intl.bind_textdomain_codeset (Config.GETTEXT_PACKAGE, "UTF-8");
        Intl.textdomain (Config.GETTEXT_PACKAGE);

        var calculadora = new Calculadora();

        stdout.printf(_("El resultado de la suma es "));
        stdout.printf(@" $(calculadora.suma(2,4,'s')) \n");
        stdout.printf(_("El resultado de la resta es "));
        stdout.printf(@"$(calculadora.resta(2,4,'r')) \n");
        stdout.printf(_("El resultado de la multiplicacion es "));
        stdout.printf(@"$(calculadora.multiplicacion(2,4,'m')) \n");
        stdout.printf(_("El resultado de la division es "));
        stdout.printf(@"$(calculadora.division(2,4,'d')) \n");

        return 0;
    }

    class Calculadora:Object{

        public Calculadora(){}
        public double suma(int x, int y, char s)
        requires (s == 's')
        ensures (result >= x && result >= y)
        {
            return x + y;
        }
        public double resta(int x, int y, char s)
        requires (s == 'r')
        ensures (result <= x)
        {
            return x - y;
        }
        public double multiplicacion(int x, int y, char s)
        requires (s == 'm')
        ensures (result >= x && result >= y)
        {
            return x * y;
        }
        public double division(int x, int y, char s)
        requires (s == 'd')
        ensures (result <= x )
        {
            return x / y;
        }
    }
    
}