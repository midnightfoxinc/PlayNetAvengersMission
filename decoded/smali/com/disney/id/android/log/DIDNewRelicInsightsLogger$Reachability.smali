.class Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$Reachability;
.super Landroid/content/BroadcastReceiver;
.source "DIDNewRelicInsightsLogger.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Reachability"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;


# direct methods
.method private constructor <init>(Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;)V
    .locals 0

    .prologue
    .line 239
    iput-object p1, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$Reachability;->this$0:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;
    .param p2, "x1"    # Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$1;

    .prologue
    .line 239
    invoke-direct {p0, p1}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$Reachability;-><init>(Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;)V

    return-void
.end method


# virtual methods
.method public isConnected()Z
    .locals 4

    .prologue
    .line 255
    iget-object v2, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$Reachability;->this$0:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    invoke-static {v2}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->access$500(Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;)Landroid/content/Context;

    move-result-object v2

    const-string v3, "connectivity"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 256
    .local v0, "cm":Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    .line 257
    .local v1, "ni":Landroid/net/NetworkInfo;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 242
    invoke-static {}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->access$100()Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 243
    :try_start_0
    iget-object v0, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$Reachability;->this$0:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    invoke-virtual {p0}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$Reachability;->isConnected()Z

    move-result v2

    invoke-static {v0, v2}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->access$202(Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;Z)Z

    .line 244
    iget-object v0, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$Reachability;->this$0:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    invoke-static {v0}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->access$200(Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$Reachability;->this$0:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    invoke-static {v0}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->access$300(Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;)Lcom/disney/id/android/log/CircularLoggingRequestQueue;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/log/CircularLoggingRequestQueue;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 245
    iget-object v0, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$Reachability;->this$0:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    invoke-static {v0}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->access$400(Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;)Ljava/lang/Thread;

    move-result-object v0

    if-nez v0, :cond_0

    .line 246
    iget-object v0, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$Reachability;->this$0:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    new-instance v2, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$LoggerThread;

    iget-object v3, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$Reachability;->this$0:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    invoke-direct {v2, v3}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$LoggerThread;-><init>(Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;)V

    invoke-static {v0, v2}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->access$402(Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;Ljava/lang/Thread;)Ljava/lang/Thread;

    .line 247
    iget-object v0, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$Reachability;->this$0:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    invoke-static {v0}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->access$400(Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;)Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 249
    :cond_0
    invoke-static {}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->access$100()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    .line 251
    :cond_1
    monitor-exit v1

    .line 252
    return-void

    .line 251
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
