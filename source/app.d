import std.stdio;
import std.datetime : SysTime;
import vibe.http.fileserver;
import vibe.http.router;
import vibe.web.web;

/**
 * Risultati per Macq
 */
struct MacqNote {

    long id;
   int slotId;
   string title;
   string message;
   int unixTimeMsecs;
   //FIX non fuxniuona!!!
   SysTime notedAt;
   //@attr("noted_at") string notedAt;
}

shared static this() {
   import std.format : format;


   auto router = new URLRouter;
   router.registerWebInterface(new NoteController(new NoteModel()));

   auto settings = new HTTPServerSettings;
   settings.port = 8080;
   settings.bindAddresses = ["::1", "127.0.0.1"];
   settings.sessionStore = new MemorySessionStore;
   try {
      auto l = listenHTTP(settings, router);
   } catch (Exception e) {
      throw e;
   }
}

final class NoteController {
   private NoteModel model;
   this(NoteModel model) {
      assert(model !is null);
      this.model = model;
   }

   @path("/note/update") void postNoteUpdate(MacqNote mn) {
      import std.format : format;

      //model.update(mn);
      //redirect("/note/%d".format(mn.id));
   }
}

class NoteModel {
   /**
    * Aggiorna la note
    */
   void update(MacqNote note) {

   }
}

