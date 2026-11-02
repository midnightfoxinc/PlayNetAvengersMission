.class Lcom/disney/id/android/webclient/DisIDPlugin$1;
.super Ljava/lang/Object;
.source "DisIDPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/id/android/webclient/DisIDPlugin;->setupDisneyId(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/id/android/webclient/DisIDPlugin;

.field final synthetic val$clientID:Ljava/lang/String;

.field final synthetic val$country:Ljava/lang/String;

.field final synthetic val$environment:Ljava/lang/String;

.field final synthetic val$javascriptDebugState:Z

.field final synthetic val$languageSelection:Ljava/lang/String;

.field final synthetic val$name:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/disney/id/android/webclient/DisIDPlugin;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/disney/id/android/webclient/DisIDPlugin;

    .prologue
    .line 83
    iput-object p1, p0, Lcom/disney/id/android/webclient/DisIDPlugin$1;->this$0:Lcom/disney/id/android/webclient/DisIDPlugin;

    iput-object p2, p0, Lcom/disney/id/android/webclient/DisIDPlugin$1;->val$name:Ljava/lang/String;

    iput-object p3, p0, Lcom/disney/id/android/webclient/DisIDPlugin$1;->val$environment:Ljava/lang/String;

    iput-object p4, p0, Lcom/disney/id/android/webclient/DisIDPlugin$1;->val$clientID:Ljava/lang/String;

    iput-boolean p5, p0, Lcom/disney/id/android/webclient/DisIDPlugin$1;->val$javascriptDebugState:Z

    iput-object p6, p0, Lcom/disney/id/android/webclient/DisIDPlugin$1;->val$country:Ljava/lang/String;

    iput-object p7, p0, Lcom/disney/id/android/webclient/DisIDPlugin$1;->val$languageSelection:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 86
    iget-object v0, p0, Lcom/disney/id/android/webclient/DisIDPlugin$1;->this$0:Lcom/disney/id/android/webclient/DisIDPlugin;

    iget-object v1, p0, Lcom/disney/id/android/webclient/DisIDPlugin$1;->val$name:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/disney/id/android/webclient/DisIDPlugin;->access$002(Lcom/disney/id/android/webclient/DisIDPlugin;Ljava/lang/String;)Ljava/lang/String;

    .line 88
    iget-object v0, p0, Lcom/disney/id/android/webclient/DisIDPlugin$1;->val$environment:Ljava/lang/String;

    sput-object v0, Lcom/disney/id/android/webclient/DisIDPlugin;->ENV_KEY:Ljava/lang/String;

    .line 89
    iget-object v0, p0, Lcom/disney/id/android/webclient/DisIDPlugin$1;->val$clientID:Ljava/lang/String;

    sput-object v0, Lcom/disney/id/android/webclient/DisIDPlugin;->CLIENT_ID_KEY:Ljava/lang/String;

    .line 90
    iget-boolean v0, p0, Lcom/disney/id/android/webclient/DisIDPlugin$1;->val$javascriptDebugState:Z

    sput-boolean v0, Lcom/disney/id/android/webclient/DisIDPlugin;->DEBUG_KEY:Z

    .line 91
    iget-object v0, p0, Lcom/disney/id/android/webclient/DisIDPlugin$1;->val$country:Ljava/lang/String;

    sput-object v0, Lcom/disney/id/android/webclient/DisIDPlugin;->COUNTRY_PREFERENCE_KEY:Ljava/lang/String;

    .line 92
    iget-object v0, p0, Lcom/disney/id/android/webclient/DisIDPlugin$1;->val$languageSelection:Ljava/lang/String;

    sput-object v0, Lcom/disney/id/android/webclient/DisIDPlugin;->LANGUAGE_PREFERENCE_KEY:Ljava/lang/String;

    .line 94
    invoke-static {}, Lcom/disney/id/android/webclient/DisIDPlugin;->access$100()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setupDisneyId-----"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/disney/id/android/webclient/DisIDPlugin$1;->val$clientID:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/disney/id/android/webclient/LogChopper;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    iget-object v0, p0, Lcom/disney/id/android/webclient/DisIDPlugin$1;->this$0:Lcom/disney/id/android/webclient/DisIDPlugin;

    iget-object v0, v0, Lcom/disney/id/android/webclient/DisIDPlugin;->mDID:Lcom/disney/id/android/DIDSession;

    if-eqz v0, :cond_0

    .line 97
    iget-object v0, p0, Lcom/disney/id/android/webclient/DisIDPlugin$1;->this$0:Lcom/disney/id/android/webclient/DisIDPlugin;

    iget-object v0, v0, Lcom/disney/id/android/webclient/DisIDPlugin;->mDID:Lcom/disney/id/android/DIDSession;

    invoke-virtual {v0}, Lcom/disney/id/android/DIDSession;->stop()V

    .line 98
    :cond_0
    invoke-static {}, Lcom/disney/id/android/webclient/DisIDPlugin;->instance()Lcom/disney/id/android/webclient/DisIDPlugin;

    sget-object v0, Lcom/disney/id/android/webclient/DisIDPlugin;->ENV_KEY:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDSessionConfig;->setEnv(Ljava/lang/String;)V

    .line 99
    invoke-static {}, Lcom/disney/id/android/webclient/DisIDPlugin;->instance()Lcom/disney/id/android/webclient/DisIDPlugin;

    sget-object v0, Lcom/disney/id/android/webclient/DisIDPlugin;->CLIENT_ID_KEY:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDSessionConfig;->setClientId(Ljava/lang/String;)V

    .line 100
    invoke-static {}, Lcom/disney/id/android/webclient/DisIDPlugin;->instance()Lcom/disney/id/android/webclient/DisIDPlugin;

    sget-object v0, Lcom/disney/id/android/webclient/DisIDPlugin;->LANGUAGE_PREFERENCE_KEY:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDSessionConfig;->setLanguagePreference(Ljava/lang/String;)V

    .line 101
    invoke-static {}, Lcom/disney/id/android/webclient/DisIDPlugin;->instance()Lcom/disney/id/android/webclient/DisIDPlugin;

    sget-object v0, Lcom/disney/id/android/webclient/DisIDPlugin;->COUNTRY_PREFERENCE_KEY:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDSessionConfig;->setCountryPreference(Ljava/lang/String;)V

    .line 102
    invoke-static {}, Lcom/disney/id/android/webclient/DisIDPlugin;->instance()Lcom/disney/id/android/webclient/DisIDPlugin;

    sget-boolean v0, Lcom/disney/id/android/webclient/DisIDPlugin;->DEBUG_KEY:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {v0}, Lcom/disney/id/android/DIDSessionConfig;->setDebug(Ljava/lang/Boolean;)V

    .line 104
    iget-object v0, p0, Lcom/disney/id/android/webclient/DisIDPlugin$1;->this$0:Lcom/disney/id/android/webclient/DisIDPlugin;

    iget-object v0, v0, Lcom/disney/id/android/webclient/DisIDPlugin;->mDID:Lcom/disney/id/android/DIDSession;

    if-nez v0, :cond_1

    .line 105
    iget-object v0, p0, Lcom/disney/id/android/webclient/DisIDPlugin$1;->this$0:Lcom/disney/id/android/webclient/DisIDPlugin;

    new-instance v1, Lcom/disney/id/android/DIDSession;

    iget-object v2, p0, Lcom/disney/id/android/webclient/DisIDPlugin$1;->this$0:Lcom/disney/id/android/webclient/DisIDPlugin;

    iget-object v2, v2, Lcom/disney/id/android/webclient/DisIDPlugin;->mContext:Landroid/content/Context;

    new-instance v3, Lcom/disney/id/android/webclient/PluginDelegate;

    invoke-direct {v3}, Lcom/disney/id/android/webclient/PluginDelegate;-><init>()V

    invoke-direct {v1, v2, v3}, Lcom/disney/id/android/DIDSession;-><init>(Landroid/content/Context;Lcom/disney/id/android/DIDSessionDelegate;)V

    iput-object v1, v0, Lcom/disney/id/android/webclient/DisIDPlugin;->mDID:Lcom/disney/id/android/DIDSession;

    .line 108
    :cond_1
    iget-object v0, p0, Lcom/disney/id/android/webclient/DisIDPlugin$1;->this$0:Lcom/disney/id/android/webclient/DisIDPlugin;

    iget-object v0, v0, Lcom/disney/id/android/webclient/DisIDPlugin;->mDID:Lcom/disney/id/android/DIDSession;

    invoke-virtual {v0}, Lcom/disney/id/android/DIDSession;->start()V

    .line 109
    return-void
.end method
