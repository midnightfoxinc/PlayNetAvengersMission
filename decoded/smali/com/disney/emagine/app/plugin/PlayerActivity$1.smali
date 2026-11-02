.class Lcom/disney/emagine/app/plugin/PlayerActivity$1;
.super Ljava/lang/Object;
.source "PlayerActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnKeyListener;


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
    .line 128
    iput-object p1, p0, Lcom/disney/emagine/app/plugin/PlayerActivity$1;->this$0:Lcom/disney/emagine/app/plugin/PlayerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onKey(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v1, 0x1

    .line 131
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-ne v0, v1, :cond_0

    const/4 v0, 0x4

    if-ne p2, v0, :cond_0

    .line 132
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 133
    :cond_0
    return v1
.end method
