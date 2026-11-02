.class Lcom/disney/emagine/sdk/ble/EMTController$7;
.super Ljava/lang/Object;
.source "EMTController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/emagine/sdk/ble/EMTController;->checkRadio()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/emagine/sdk/ble/EMTController;


# direct methods
.method constructor <init>(Lcom/disney/emagine/sdk/ble/EMTController;)V
    .locals 0
    .param p1, "this$0"    # Lcom/disney/emagine/sdk/ble/EMTController;

    .prologue
    .line 715
    iput-object p1, p0, Lcom/disney/emagine/sdk/ble/EMTController$7;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 717
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController$7;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-static {v0}, Lcom/disney/emagine/sdk/ble/EMTController;->access$000(Lcom/disney/emagine/sdk/ble/EMTController;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v0

    const-string v1, "EMTController"

    const-string v2, "Toast BLE disabled."

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 718
    invoke-static {}, Lcom/disney/emagine/app/EmagineApplication;->app()Lcom/disney/emagine/app/EmagineApplication;

    move-result-object v0

    const-string v1, "Bluetooth is disabled. Please enable it."

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 719
    return-void
.end method
