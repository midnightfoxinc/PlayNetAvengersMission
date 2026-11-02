.class Lcom/disney/id/android/DIDSessionManager$1$1;
.super Ljava/lang/Object;
.source "DIDSessionManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/id/android/DIDSessionManager$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/disney/id/android/DIDSessionManager$1;

.field final synthetic val$callback:Lcom/disney/id/android/DIDSessionDelegate;


# direct methods
.method constructor <init>(Lcom/disney/id/android/DIDSessionManager$1;Lcom/disney/id/android/DIDSessionDelegate;)V
    .locals 0

    .prologue
    .line 92
    iput-object p1, p0, Lcom/disney/id/android/DIDSessionManager$1$1;->this$1:Lcom/disney/id/android/DIDSessionManager$1;

    iput-object p2, p0, Lcom/disney/id/android/DIDSessionManager$1$1;->val$callback:Lcom/disney/id/android/DIDSessionDelegate;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 95
    iget-object v0, p0, Lcom/disney/id/android/DIDSessionManager$1$1;->this$1:Lcom/disney/id/android/DIDSessionManager$1;

    iget-object v0, v0, Lcom/disney/id/android/DIDSessionManager$1;->val$response:Lcom/disney/id/android/DIDResponse;

    invoke-virtual {v0}, Lcom/disney/id/android/DIDResponse;->getResponseCode()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 160
    :pswitch_0
    invoke-static {}, Lcom/disney/id/android/DIDSessionManager;->access$100()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Error unsupported response"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 164
    :goto_0
    return-void

    .line 97
    :pswitch_1
    iget-object v0, p0, Lcom/disney/id/android/DIDSessionManager$1$1;->val$callback:Lcom/disney/id/android/DIDSessionDelegate;

    invoke-interface {v0}, Lcom/disney/id/android/DIDSessionDelegate;->onLogin()V

    goto :goto_0

    .line 100
    :pswitch_2
    iget-object v0, p0, Lcom/disney/id/android/DIDSessionManager$1$1;->val$callback:Lcom/disney/id/android/DIDSessionDelegate;

    invoke-interface {v0}, Lcom/disney/id/android/DIDSessionDelegate;->onLogout()V

    goto :goto_0

    .line 103
    :pswitch_3
    iget-object v0, p0, Lcom/disney/id/android/DIDSessionManager$1$1;->val$callback:Lcom/disney/id/android/DIDSessionDelegate;

    invoke-interface {v0}, Lcom/disney/id/android/DIDSessionDelegate;->onCreate()V

    goto :goto_0

    .line 106
    :pswitch_4
    iget-object v0, p0, Lcom/disney/id/android/DIDSessionManager$1$1;->val$callback:Lcom/disney/id/android/DIDSessionDelegate;

    iget-object v1, p0, Lcom/disney/id/android/DIDSessionManager$1$1;->this$1:Lcom/disney/id/android/DIDSessionManager$1;

    iget-object v1, v1, Lcom/disney/id/android/DIDSessionManager$1;->val$response:Lcom/disney/id/android/DIDResponse;

    invoke-virtual {v1}, Lcom/disney/id/android/DIDResponse;->getResponseData()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/disney/id/android/DIDSessionDelegate;->onUpdate(Ljava/lang/String;)V

    goto :goto_0

    .line 109
    :pswitch_5
    iget-object v0, p0, Lcom/disney/id/android/DIDSessionManager$1$1;->val$callback:Lcom/disney/id/android/DIDSessionDelegate;

    invoke-interface {v0}, Lcom/disney/id/android/DIDSessionDelegate;->onForceTokenRefreshSuccess()V

    goto :goto_0

    .line 112
    :pswitch_6
    iget-object v1, p0, Lcom/disney/id/android/DIDSessionManager$1$1;->val$callback:Lcom/disney/id/android/DIDSessionDelegate;

    iget-object v0, p0, Lcom/disney/id/android/DIDSessionManager$1$1;->this$1:Lcom/disney/id/android/DIDSessionManager$1;

    iget-object v0, v0, Lcom/disney/id/android/DIDSessionManager$1;->val$response:Lcom/disney/id/android/DIDResponse;

    invoke-virtual {v0}, Lcom/disney/id/android/DIDResponse;->getError()Lcom/disney/id/android/DIDException;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/disney/id/android/DIDSessionManager$1$1;->this$1:Lcom/disney/id/android/DIDSessionManager$1;

    iget-object v0, v0, Lcom/disney/id/android/DIDSessionManager$1;->val$response:Lcom/disney/id/android/DIDResponse;

    invoke-virtual {v0}, Lcom/disney/id/android/DIDResponse;->getError()Lcom/disney/id/android/DIDException;

    move-result-object v0

    :goto_1
    invoke-interface {v1, v0}, Lcom/disney/id/android/DIDSessionDelegate;->onForceTokenRefreshFailure(Lcom/disney/id/android/DIDException;)V

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/disney/id/android/DIDException;

    invoke-direct {v0}, Lcom/disney/id/android/DIDException;-><init>()V

    goto :goto_1

    .line 115
    :pswitch_7
    iget-object v0, p0, Lcom/disney/id/android/DIDSessionManager$1$1;->val$callback:Lcom/disney/id/android/DIDSessionDelegate;

    invoke-interface {v0}, Lcom/disney/id/android/DIDSessionDelegate;->onLowTrust()V

    goto :goto_0

    .line 118
    :pswitch_8
    iget-object v0, p0, Lcom/disney/id/android/DIDSessionManager$1$1;->val$callback:Lcom/disney/id/android/DIDSessionDelegate;

    iget-object v1, p0, Lcom/disney/id/android/DIDSessionManager$1$1;->this$1:Lcom/disney/id/android/DIDSessionManager$1;

    iget-object v1, v1, Lcom/disney/id/android/DIDSessionManager$1;->val$response:Lcom/disney/id/android/DIDResponse;

    invoke-virtual {v1}, Lcom/disney/id/android/DIDResponse;->getResponseData()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/disney/id/android/DIDSessionDelegate;->onOptIn(Ljava/lang/String;)V

    goto :goto_0

    .line 121
    :pswitch_9
    iget-object v0, p0, Lcom/disney/id/android/DIDSessionManager$1$1;->val$callback:Lcom/disney/id/android/DIDSessionDelegate;

    invoke-interface {v0}, Lcom/disney/id/android/DIDSessionDelegate;->onReauth()V

    goto :goto_0

    .line 124
    :pswitch_a
    iget-object v0, p0, Lcom/disney/id/android/DIDSessionManager$1$1;->val$callback:Lcom/disney/id/android/DIDSessionDelegate;

    invoke-interface {v0}, Lcom/disney/id/android/DIDSessionDelegate;->onRefresh()V

    goto :goto_0

    .line 127
    :pswitch_b
    iget-object v0, p0, Lcom/disney/id/android/DIDSessionManager$1$1;->val$callback:Lcom/disney/id/android/DIDSessionDelegate;

    invoke-interface {v0}, Lcom/disney/id/android/DIDSessionDelegate;->onRefreshGuestDataSuccess()V

    goto :goto_0

    .line 130
    :pswitch_c
    iget-object v1, p0, Lcom/disney/id/android/DIDSessionManager$1$1;->val$callback:Lcom/disney/id/android/DIDSessionDelegate;

    iget-object v0, p0, Lcom/disney/id/android/DIDSessionManager$1$1;->this$1:Lcom/disney/id/android/DIDSessionManager$1;

    iget-object v0, v0, Lcom/disney/id/android/DIDSessionManager$1;->val$response:Lcom/disney/id/android/DIDResponse;

    invoke-virtual {v0}, Lcom/disney/id/android/DIDResponse;->getError()Lcom/disney/id/android/DIDException;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/disney/id/android/DIDSessionManager$1$1;->this$1:Lcom/disney/id/android/DIDSessionManager$1;

    iget-object v0, v0, Lcom/disney/id/android/DIDSessionManager$1;->val$response:Lcom/disney/id/android/DIDResponse;

    invoke-virtual {v0}, Lcom/disney/id/android/DIDResponse;->getError()Lcom/disney/id/android/DIDException;

    move-result-object v0

    :goto_2
    invoke-interface {v1, v0}, Lcom/disney/id/android/DIDSessionDelegate;->onRefreshGuestDataFailure(Lcom/disney/id/android/DIDException;)V

    goto/16 :goto_0

    :cond_1
    new-instance v0, Lcom/disney/id/android/DIDException;

    invoke-direct {v0}, Lcom/disney/id/android/DIDException;-><init>()V

    goto :goto_2

    .line 133
    :pswitch_d
    iget-object v0, p0, Lcom/disney/id/android/DIDSessionManager$1$1;->val$callback:Lcom/disney/id/android/DIDSessionDelegate;

    invoke-interface {v0}, Lcom/disney/id/android/DIDSessionDelegate;->onLoginBlueSuccess()V

    goto/16 :goto_0

    .line 136
    :pswitch_e
    iget-object v1, p0, Lcom/disney/id/android/DIDSessionManager$1$1;->val$callback:Lcom/disney/id/android/DIDSessionDelegate;

    iget-object v0, p0, Lcom/disney/id/android/DIDSessionManager$1$1;->this$1:Lcom/disney/id/android/DIDSessionManager$1;

    iget-object v0, v0, Lcom/disney/id/android/DIDSessionManager$1;->val$response:Lcom/disney/id/android/DIDResponse;

    invoke-virtual {v0}, Lcom/disney/id/android/DIDResponse;->getError()Lcom/disney/id/android/DIDException;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/disney/id/android/DIDSessionManager$1$1;->this$1:Lcom/disney/id/android/DIDSessionManager$1;

    iget-object v0, v0, Lcom/disney/id/android/DIDSessionManager$1;->val$response:Lcom/disney/id/android/DIDResponse;

    invoke-virtual {v0}, Lcom/disney/id/android/DIDResponse;->getError()Lcom/disney/id/android/DIDException;

    move-result-object v0

    :goto_3
    invoke-interface {v1, v0}, Lcom/disney/id/android/DIDSessionDelegate;->onLoginBlueFailure(Lcom/disney/id/android/DIDException;)V

    goto/16 :goto_0

    :cond_2
    new-instance v0, Lcom/disney/id/android/DIDException;

    invoke-direct {v0}, Lcom/disney/id/android/DIDException;-><init>()V

    goto :goto_3

    .line 139
    :pswitch_f
    iget-object v0, p0, Lcom/disney/id/android/DIDSessionManager$1$1;->val$callback:Lcom/disney/id/android/DIDSessionDelegate;

    invoke-interface {v0}, Lcom/disney/id/android/DIDSessionDelegate;->onClose()V

    goto/16 :goto_0

    .line 157
    :pswitch_10
    iget-object v1, p0, Lcom/disney/id/android/DIDSessionManager$1$1;->val$callback:Lcom/disney/id/android/DIDSessionDelegate;

    iget-object v0, p0, Lcom/disney/id/android/DIDSessionManager$1$1;->this$1:Lcom/disney/id/android/DIDSessionManager$1;

    iget-object v0, v0, Lcom/disney/id/android/DIDSessionManager$1;->val$response:Lcom/disney/id/android/DIDResponse;

    invoke-virtual {v0}, Lcom/disney/id/android/DIDResponse;->getError()Lcom/disney/id/android/DIDException;

    move-result-object v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/disney/id/android/DIDSessionManager$1$1;->this$1:Lcom/disney/id/android/DIDSessionManager$1;

    iget-object v0, v0, Lcom/disney/id/android/DIDSessionManager$1;->val$response:Lcom/disney/id/android/DIDResponse;

    invoke-virtual {v0}, Lcom/disney/id/android/DIDResponse;->getError()Lcom/disney/id/android/DIDException;

    move-result-object v0

    :goto_4
    invoke-interface {v1, v0}, Lcom/disney/id/android/DIDSessionDelegate;->onError(Lcom/disney/id/android/DIDException;)V

    goto/16 :goto_0

    :cond_3
    new-instance v0, Lcom/disney/id/android/DIDException;

    invoke-direct {v0}, Lcom/disney/id/android/DIDException;-><init>()V

    goto :goto_4

    .line 95
    :pswitch_data_0
    .packed-switch -0xf
        :pswitch_10
        :pswitch_10
        :pswitch_10
        :pswitch_10
        :pswitch_10
        :pswitch_10
        :pswitch_10
        :pswitch_10
        :pswitch_10
        :pswitch_10
        :pswitch_10
        :pswitch_10
        :pswitch_10
        :pswitch_10
        :pswitch_10
        :pswitch_f
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_10
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_d
        :pswitch_e
        :pswitch_2
    .end packed-switch
.end method
