.class Lcom/disney/id/android/localization/DIDLocalizationManager$1;
.super Ljava/lang/Object;
.source "DIDLocalizationManager.java"

# interfaces
.implements Lcom/disney/id/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/id/android/localization/DIDLocalizationManager;->loadFromL10N(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/disney/id/android/volley/Response$Listener",
        "<",
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/id/android/localization/DIDLocalizationManager;

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/disney/id/android/localization/DIDLocalizationManager;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 134
    iput-object p1, p0, Lcom/disney/id/android/localization/DIDLocalizationManager$1;->this$0:Lcom/disney/id/android/localization/DIDLocalizationManager;

    iput-object p2, p0, Lcom/disney/id/android/localization/DIDLocalizationManager$1;->val$url:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 134
    check-cast p1, Lorg/json/JSONObject;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/disney/id/android/localization/DIDLocalizationManager$1;->onResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONObject;)V
    .locals 2
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 137
    invoke-static {}, Lcom/disney/id/android/localization/DIDLocalizationManager;->access$000()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "onResponse() called"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    iget-object v0, p0, Lcom/disney/id/android/localization/DIDLocalizationManager$1;->this$0:Lcom/disney/id/android/localization/DIDLocalizationManager;

    iget-object v1, p0, Lcom/disney/id/android/localization/DIDLocalizationManager$1;->val$url:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/disney/id/android/localization/DIDLocalizationManager;->access$102(Lcom/disney/id/android/localization/DIDLocalizationManager;Ljava/lang/String;)Ljava/lang/String;

    .line 139
    iget-object v0, p0, Lcom/disney/id/android/localization/DIDLocalizationManager$1;->this$0:Lcom/disney/id/android/localization/DIDLocalizationManager;

    invoke-static {v0, p1}, Lcom/disney/id/android/localization/DIDLocalizationManager;->access$202(Lcom/disney/id/android/localization/DIDLocalizationManager;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    .line 140
    return-void
.end method
