.class Lcom/disney/emagine/sdk/foreground/Foreground$1;
.super Ljava/lang/Object;
.source "Foreground.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/emagine/sdk/foreground/Foreground;->onActivityPaused(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/emagine/sdk/foreground/Foreground;


# direct methods
.method constructor <init>(Lcom/disney/emagine/sdk/foreground/Foreground;)V
    .locals 0
    .param p1, "this$0"    # Lcom/disney/emagine/sdk/foreground/Foreground;

    .prologue
    .line 165
    iput-object p1, p0, Lcom/disney/emagine/sdk/foreground/Foreground$1;->this$0:Lcom/disney/emagine/sdk/foreground/Foreground;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 168
    iget-object v2, p0, Lcom/disney/emagine/sdk/foreground/Foreground$1;->this$0:Lcom/disney/emagine/sdk/foreground/Foreground;

    invoke-static {v2}, Lcom/disney/emagine/sdk/foreground/Foreground;->access$000(Lcom/disney/emagine/sdk/foreground/Foreground;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/disney/emagine/sdk/foreground/Foreground$1;->this$0:Lcom/disney/emagine/sdk/foreground/Foreground;

    invoke-static {v2}, Lcom/disney/emagine/sdk/foreground/Foreground;->access$100(Lcom/disney/emagine/sdk/foreground/Foreground;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 169
    iget-object v2, p0, Lcom/disney/emagine/sdk/foreground/Foreground$1;->this$0:Lcom/disney/emagine/sdk/foreground/Foreground;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/disney/emagine/sdk/foreground/Foreground;->access$002(Lcom/disney/emagine/sdk/foreground/Foreground;Z)Z

    .line 170
    iget-object v2, p0, Lcom/disney/emagine/sdk/foreground/Foreground$1;->this$0:Lcom/disney/emagine/sdk/foreground/Foreground;

    invoke-static {v2}, Lcom/disney/emagine/sdk/foreground/Foreground;->access$200(Lcom/disney/emagine/sdk/foreground/Foreground;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v2

    sget-object v3, Lcom/disney/emagine/sdk/foreground/Foreground;->TAG:Ljava/lang/String;

    const-string v4, "went background"

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 171
    iget-object v2, p0, Lcom/disney/emagine/sdk/foreground/Foreground$1;->this$0:Lcom/disney/emagine/sdk/foreground/Foreground;

    invoke-static {v2}, Lcom/disney/emagine/sdk/foreground/Foreground;->access$300(Lcom/disney/emagine/sdk/foreground/Foreground;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/disney/emagine/sdk/foreground/Foreground$Listener;

    .line 173
    .local v1, "l":Lcom/disney/emagine/sdk/foreground/Foreground$Listener;
    :try_start_0
    invoke-interface {v1}, Lcom/disney/emagine/sdk/foreground/Foreground$Listener;->onBecameBackground()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 174
    :catch_0
    move-exception v0

    .line 175
    .local v0, "exc":Ljava/lang/Exception;
    iget-object v3, p0, Lcom/disney/emagine/sdk/foreground/Foreground$1;->this$0:Lcom/disney/emagine/sdk/foreground/Foreground;

    invoke-static {v3}, Lcom/disney/emagine/sdk/foreground/Foreground;->access$200(Lcom/disney/emagine/sdk/foreground/Foreground;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v3

    sget-object v4, Lcom/disney/emagine/sdk/foreground/Foreground;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Listener threw exception: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 179
    .end local v0    # "exc":Ljava/lang/Exception;
    .end local v1    # "l":Lcom/disney/emagine/sdk/foreground/Foreground$Listener;
    :cond_0
    iget-object v2, p0, Lcom/disney/emagine/sdk/foreground/Foreground$1;->this$0:Lcom/disney/emagine/sdk/foreground/Foreground;

    invoke-static {v2}, Lcom/disney/emagine/sdk/foreground/Foreground;->access$200(Lcom/disney/emagine/sdk/foreground/Foreground;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v2

    sget-object v3, Lcom/disney/emagine/sdk/foreground/Foreground;->TAG:Ljava/lang/String;

    const-string v4, "still foreground"

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    :cond_1
    return-void
.end method
