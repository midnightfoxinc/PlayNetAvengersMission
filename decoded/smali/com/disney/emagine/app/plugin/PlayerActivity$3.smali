.class Lcom/disney/emagine/app/plugin/PlayerActivity$3;
.super Ljava/lang/Object;
.source "PlayerActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


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
    .line 118
    iput-object p1, p0, Lcom/disney/emagine/app/plugin/PlayerActivity$3;->this$0:Lcom/disney/emagine/app/plugin/PlayerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 120
    return-void
.end method
