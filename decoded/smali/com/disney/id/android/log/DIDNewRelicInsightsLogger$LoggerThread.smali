.class Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$LoggerThread;
.super Ljava/lang/Thread;
.source "DIDNewRelicInsightsLogger.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LoggerThread"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;


# direct methods
.method public constructor <init>(Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;)V
    .locals 1

    .prologue
    .line 262
    iput-object p1, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$LoggerThread;->this$0:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    .line 263
    const-string v0, "DisneyIDNewRelicInsightsLogger"

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 264
    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .prologue
    .line 268
    :try_start_0
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 270
    .local v0, "client":Lorg/apache/http/client/HttpClient;
    :goto_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v7

    if-nez v7, :cond_7

    .line 274
    invoke-static {}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->access$100()Ljava/lang/Object;

    move-result-object v8

    monitor-enter v8
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 275
    :try_start_1
    iget-object v7, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$LoggerThread;->this$0:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    invoke-static {v7}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->access$200(Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;)Z

    move-result v7

    if-eqz v7, :cond_0

    iget-object v7, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$LoggerThread;->this$0:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    invoke-static {v7}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->access$300(Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;)Lcom/disney/id/android/log/CircularLoggingRequestQueue;

    move-result-object v7

    invoke-virtual {v7}, Lcom/disney/id/android/log/CircularLoggingRequestQueue;->size()I

    move-result v7

    if-nez v7, :cond_2

    .line 276
    :cond_0
    invoke-static {}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->access$100()Ljava/lang/Object;

    move-result-object v7

    invoke-static {}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->access$600()J

    move-result-wide v10

    invoke-virtual {v7, v10, v11}, Ljava/lang/Object;->wait(J)V

    .line 277
    iget-object v7, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$LoggerThread;->this$0:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    invoke-static {v7}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->access$200(Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;)Z

    move-result v7

    if-eqz v7, :cond_1

    iget-object v7, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$LoggerThread;->this$0:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    invoke-static {v7}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->access$300(Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;)Lcom/disney/id/android/log/CircularLoggingRequestQueue;

    move-result-object v7

    invoke-virtual {v7}, Lcom/disney/id/android/log/CircularLoggingRequestQueue;->size()I

    move-result v7

    if-nez v7, :cond_2

    .line 278
    :cond_1
    monitor-exit v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 313
    invoke-static {}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->access$100()Ljava/lang/Object;

    move-result-object v8

    monitor-enter v8

    .line 314
    :try_start_2
    iget-object v7, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$LoggerThread;->this$0:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    const/4 v9, 0x0

    invoke-static {v7, v9}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->access$402(Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;Ljava/lang/Thread;)Ljava/lang/Thread;

    .line 315
    monitor-exit v8

    .line 317
    .end local v0    # "client":Lorg/apache/http/client/HttpClient;
    :goto_1
    return-void

    .line 315
    .restart local v0    # "client":Lorg/apache/http/client/HttpClient;
    :catchall_0
    move-exception v7

    monitor-exit v8
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v7

    .line 281
    :cond_2
    :try_start_3
    iget-object v7, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$LoggerThread;->this$0:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    invoke-static {v7}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->access$300(Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;)Lcom/disney/id/android/log/CircularLoggingRequestQueue;

    move-result-object v7

    invoke-virtual {v7}, Lcom/disney/id/android/log/CircularLoggingRequestQueue;->peek()Lorg/json/JSONObject;

    move-result-object v2

    .line 283
    .local v2, "event":Lorg/json/JSONObject;
    monitor-exit v8
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 285
    const/4 v6, 0x0

    .line 287
    .local v6, "success":Z
    if-eqz v2, :cond_3

    :try_start_4
    invoke-virtual {v2}, Lorg/json/JSONObject;->length()I

    move-result v7

    if-nez v7, :cond_5

    .line 288
    :cond_3
    iget-object v7, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$LoggerThread;->this$0:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    invoke-static {v7}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->access$300(Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;)Lcom/disney/id/android/log/CircularLoggingRequestQueue;

    move-result-object v7

    invoke-virtual {v7}, Lcom/disney/id/android/log/CircularLoggingRequestQueue;->loggingAttemptUnexpectedFailure()V
    :try_end_4
    .catch Ljava/net/ConnectException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    goto :goto_0

    .line 302
    :catch_0
    move-exception v1

    .line 303
    .local v1, "e":Ljava/net/ConnectException;
    :try_start_5
    invoke-static {}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->access$100()Ljava/lang/Object;

    move-result-object v8

    monitor-enter v8
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 304
    :try_start_6
    iget-object v7, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$LoggerThread;->this$0:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    const/4 v9, 0x0

    invoke-static {v7, v9}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->access$202(Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;Z)Z

    .line 305
    monitor-exit v8
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    .line 308
    .end local v1    # "e":Ljava/net/ConnectException;
    :cond_4
    :goto_2
    if-eqz v6, :cond_6

    :try_start_7
    invoke-static {}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->access$800()J

    move-result-wide v8

    :goto_3
    invoke-static {v8, v9}, Ljava/lang/Thread;->sleep(J)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    goto/16 :goto_0

    .line 310
    .end local v0    # "client":Lorg/apache/http/client/HttpClient;
    .end local v2    # "event":Lorg/json/JSONObject;
    .end local v6    # "success":Z
    :catch_1
    move-exception v7

    .line 313
    invoke-static {}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->access$100()Ljava/lang/Object;

    move-result-object v8

    monitor-enter v8

    .line 314
    :try_start_8
    iget-object v7, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$LoggerThread;->this$0:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    const/4 v9, 0x0

    invoke-static {v7, v9}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->access$402(Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;Ljava/lang/Thread;)Ljava/lang/Thread;

    .line 315
    monitor-exit v8

    goto :goto_1

    :catchall_1
    move-exception v7

    monitor-exit v8
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    throw v7

    .line 283
    .restart local v0    # "client":Lorg/apache/http/client/HttpClient;
    :catchall_2
    move-exception v7

    :try_start_9
    monitor-exit v8
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    :try_start_a
    throw v7
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_1
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    .line 313
    .end local v0    # "client":Lorg/apache/http/client/HttpClient;
    :catchall_3
    move-exception v7

    invoke-static {}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->access$100()Ljava/lang/Object;

    move-result-object v8

    monitor-enter v8

    .line 314
    :try_start_b
    iget-object v9, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$LoggerThread;->this$0:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    const/4 v10, 0x0

    invoke-static {v9, v10}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->access$402(Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;Ljava/lang/Thread;)Ljava/lang/Thread;

    .line 315
    monitor-exit v8
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_6

    throw v7

    .line 292
    .restart local v0    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v2    # "event":Lorg/json/JSONObject;
    .restart local v6    # "success":Z
    :cond_5
    :try_start_c
    new-instance v3, Lorg/apache/http/client/methods/HttpGet;

    iget-object v7, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$LoggerThread;->this$0:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    invoke-static {v7, v2}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->access$700(Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v3, v7}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 294
    .local v3, "request":Lorg/apache/http/client/methods/HttpGet;
    new-instance v4, Lorg/apache/http/entity/StringEntity;

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v8, "UTF-8"

    invoke-direct {v4, v7, v8}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    .local v4, "se":Lorg/apache/http/entity/StringEntity;
    const-string v7, "UTF-8"

    invoke-virtual {v4, v7}, Lorg/apache/http/entity/StringEntity;->setContentEncoding(Ljava/lang/String;)V

    .line 297
    invoke-interface {v0, v3}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v7

    invoke-interface {v7}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v5

    .line 298
    .local v5, "statusLine":Lorg/apache/http/StatusLine;
    invoke-interface {v5}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v7

    const/16 v8, 0xc8

    if-ne v7, v8, :cond_4

    .line 299
    iget-object v7, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$LoggerThread;->this$0:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    invoke-static {v7}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->access$300(Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;)Lcom/disney/id/android/log/CircularLoggingRequestQueue;

    move-result-object v7

    invoke-virtual {v7}, Lcom/disney/id/android/log/CircularLoggingRequestQueue;->loggingAttemptSuccessful()V
    :try_end_c
    .catch Ljava/net/ConnectException; {:try_start_c .. :try_end_c} :catch_0
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_1
    .catchall {:try_start_c .. :try_end_c} :catchall_3

    .line 300
    const/4 v6, 0x1

    goto :goto_2

    .line 305
    .end local v3    # "request":Lorg/apache/http/client/methods/HttpGet;
    .end local v4    # "se":Lorg/apache/http/entity/StringEntity;
    .end local v5    # "statusLine":Lorg/apache/http/StatusLine;
    .restart local v1    # "e":Ljava/net/ConnectException;
    :catchall_4
    move-exception v7

    :try_start_d
    monitor-exit v8
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_4

    :try_start_e
    throw v7

    .line 308
    .end local v1    # "e":Ljava/net/ConnectException;
    :cond_6
    invoke-static {}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->access$600()J
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_1
    .catchall {:try_start_e .. :try_end_e} :catchall_3

    move-result-wide v8

    goto :goto_3

    .line 313
    .end local v2    # "event":Lorg/json/JSONObject;
    .end local v6    # "success":Z
    :cond_7
    invoke-static {}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->access$100()Ljava/lang/Object;

    move-result-object v8

    monitor-enter v8

    .line 314
    :try_start_f
    iget-object v7, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$LoggerThread;->this$0:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    const/4 v9, 0x0

    invoke-static {v7, v9}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->access$402(Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;Ljava/lang/Thread;)Ljava/lang/Thread;

    .line 315
    monitor-exit v8

    goto/16 :goto_1

    :catchall_5
    move-exception v7

    monitor-exit v8
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_5

    throw v7

    .end local v0    # "client":Lorg/apache/http/client/HttpClient;
    :catchall_6
    move-exception v7

    :try_start_10
    monitor-exit v8
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_6

    throw v7
.end method
