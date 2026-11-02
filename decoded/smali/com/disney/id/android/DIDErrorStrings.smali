.class Lcom/disney/id/android/DIDErrorStrings;
.super Ljava/lang/Object;
.source "DIDErrorStrings.java"


# static fields
.field static final DEFAULT_ERROR:Ljava/lang/String; = "ERROR_INTERNAL"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static getString(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "errorCode"    # Ljava/lang/String;

    .prologue
    .line 20
    invoke-static {}, Lcom/disney/id/android/localization/DIDLocalizationManager;->getInstance()Lcom/disney/id/android/localization/DIDLocalizationManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/disney/id/android/localization/DIDLocalizationManager;->hasMessageText(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 21
    invoke-static {}, Lcom/disney/id/android/localization/DIDLocalizationManager;->getInstance()Lcom/disney/id/android/localization/DIDLocalizationManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/disney/id/android/localization/DIDLocalizationManager;->getMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 22
    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lcom/disney/id/android/localization/DIDLocalizationManager;->getInstance()Lcom/disney/id/android/localization/DIDLocalizationManager;

    move-result-object v0

    const-string v1, "ERROR_INTERNAL"

    invoke-virtual {v0, v1}, Lcom/disney/id/android/localization/DIDLocalizationManager;->getMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
