.class Lcom/disney/id/android/DIDForeground$1;
.super Ljava/lang/Object;
.source "DIDForeground.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/id/android/DIDForeground;->onActivityPaused(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/id/android/DIDForeground;


# direct methods
.method constructor <init>(Lcom/disney/id/android/DIDForeground;)V
    .locals 0

    .prologue
    .line 152
    iput-object p1, p0, Lcom/disney/id/android/DIDForeground$1;->this$0:Lcom/disney/id/android/DIDForeground;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 155
    iget-object v3, p0, Lcom/disney/id/android/DIDForeground$1;->this$0:Lcom/disney/id/android/DIDForeground;

    invoke-static {v3}, Lcom/disney/id/android/DIDForeground;->access$000(Lcom/disney/id/android/DIDForeground;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/disney/id/android/DIDForeground$1;->this$0:Lcom/disney/id/android/DIDForeground;

    invoke-static {v3}, Lcom/disney/id/android/DIDForeground;->access$100(Lcom/disney/id/android/DIDForeground;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 156
    iget-object v3, p0, Lcom/disney/id/android/DIDForeground$1;->this$0:Lcom/disney/id/android/DIDForeground;

    const/4 v4, 0x0

    invoke-static {v3, v4}, Lcom/disney/id/android/DIDForeground;->access$002(Lcom/disney/id/android/DIDForeground;Z)Z

    .line 158
    iget-object v3, p0, Lcom/disney/id/android/DIDForeground$1;->this$0:Lcom/disney/id/android/DIDForeground;

    invoke-static {v3}, Lcom/disney/id/android/DIDForeground;->access$200(Lcom/disney/id/android/DIDForeground;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/disney/id/android/DIDForeground$Listener;

    .line 160
    .local v2, "l":Lcom/disney/id/android/DIDForeground$Listener;
    :try_start_0
    invoke-interface {v2}, Lcom/disney/id/android/DIDForeground$Listener;->onBecameBackground()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 161
    :catch_0
    move-exception v0

    .line 162
    .local v0, "exc":Ljava/lang/Exception;
    sget-object v3, Lcom/disney/id/android/DIDForeground;->TAG:Ljava/lang/String;

    const-string v4, "Listener threw exception!"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 168
    .end local v0    # "exc":Ljava/lang/Exception;
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "l":Lcom/disney/id/android/DIDForeground$Listener;
    :cond_0
    return-void
.end method
