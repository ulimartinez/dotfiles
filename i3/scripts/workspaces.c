#include <glib/gprintf.h>
#include <i3ipc-glib/i3ipc-glib.h>
#include <lzma.h>

void move_workspaces(i3ipcConnection *conn, GSList *ws);

gint main() {
    //create an i3ipc connection
    i3ipcConnection *conn;
    conn = i3ipc_connection_new(NULL, NULL);

    //TODO: make a connecction to the workspces event
    //GClosure *clos = g_cclosure_new(&move_workspaces, NULL, NULL);
    //i3ipc_connection_on(conn, "workspace",  NULL, NULL);

    //get all the workspaces
    GSList *ws;
    ws = i3ipc_connection_get_workspaces(conn, NULL);
    //move the workspaces
    move_workspaces(conn, ws);

    //cleanup
    g_slist_free_full(ws, (gpointer)i3ipc_workspace_reply_free);
    g_object_unref(conn);

    return 0;
}

void move_workspaces(i3ipcConnection *conn, GSList *ws) {
    GSList *out;
    out = i3ipc_connection_get_outputs(conn, NULL);
    gint out_len = g_slist_length(out);
    gchar *displs[2];
    int ind = 0;
    for(uint j = 0; j < out_len; j++){
        i3ipcOutputReply *curr = (i3ipcOutputReply *)g_slist_nth_data(out, j);
        if(curr->active) {
            displs[ind] = curr->name;
            ind++;
        }
    }
    gint len = g_slist_length(ws);
    char buf[45];
    for(uint i = 0; i < len; i++){
        int num = ((i3ipcWorkspaceReply *)g_slist_nth_data(ws, i))->num;
        int odd = !(num % 2);
        sprintf(buf, "workspace %i, move workspace to output %s", num, *(displs + odd));
        i3ipc_connection_message(conn, I3IPC_MESSAGE_TYPE_COMMAND, buf, NULL);
    }
    g_slist_free_full(out, (gpointer)i3ipc_output_reply_free);
}