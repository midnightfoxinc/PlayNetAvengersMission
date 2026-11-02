.class Lcom/disney/id/android/localization/DIDLocalizationManager$2;
.super Ljava/lang/Object;
.source "DIDLocalizationManager.java"

# interfaces
.implements Lcom/disney/id/android/volley/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/id/android/localization/DIDLocalizationManager;->loadFromL10N(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/id/android/localization/DIDLocalizationManager;

.field final synthetic val$loadLangPref:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/disney/id/android/localization/DIDLocalizationManager;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 141
    iput-object p1, p0, Lcom/disney/id/android/localization/DIDLocalizationManager$2;->this$0:Lcom/disney/id/android/localization/DIDLocalizationManager;

    iput-object p2, p0, Lcom/disney/id/android/localization/DIDLocalizationManager$2;->val$loadLangPref:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/disney/id/android/volley/VolleyError;)V
    .locals 2
    .param p1, "error"    # Lcom/disney/id/android/volley/VolleyError;

    .prologue
    .line 144
    invoke-static {}, Lcom/disney/id/android/localization/DIDLocalizationManager;->access$000()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "onErrorResponse() called"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    iget-object v0, p0, Lcom/disney/id/android/localization/DIDLocalizationManager$2;->this$0:Lcom/disney/id/android/localization/DIDLocalizationManager;

    iget-object v1, p0, Lcom/disney/id/android/localization/DIDLocalizationManager$2;->val$loadLangPref:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/disney/id/android/localization/DIDLocalizationManager;->access$300(Lcom/disney/id/android/localization/DIDLocalizationManager;Ljava/lang/String;)V

    .line 146
    return-void
.end method
