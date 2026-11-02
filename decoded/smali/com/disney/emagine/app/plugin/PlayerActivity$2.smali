.class Lcom/disney/emagine/app/plugin/PlayerActivity$2;
.super Ljava/lang/Object;
.source "PlayerActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/emagine/app/plugin/PlayerActivity;->checkPermissions()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/emagine/app/plugin/PlayerActivity;


# direct methods
.method constructor <init>(Lcom/disney/emagine/app/plugin/PlayerActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/disney/emagine/app/plugin/PlayerActivity;

    .prologue
    .line 122
    iput-object p1, p0, Lcom/disney/emagine/app/plugin/PlayerActivity$2;->this$0:Lcom/disney/emagine/app/plugin/PlayerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 125
    iget-object v0, p0, Lcom/disney/emagine/app/plugin/PlayerActivity$2;->this$0:Lcom/disney/emagine/app/plugin/PlayerActivity;

    invoke-static {v0}, Lcom/disney/emagine/app/plugin/PlayerActivity;->access$000(Lcom/disney/emagine/app/plugin/PlayerActivity;)V

    .line 126
    return-void
.end method
