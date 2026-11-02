.class public Lcom/disney/id/android/external/DIDExternalUtils;
.super Ljava/lang/Object;
.source "DIDExternalUtils.java"


# static fields
.field public static final EXTERNAL_LOGIN_SUPPORTED_PARAM:Ljava/lang/String; = "socialLoginSupported"

.field static final FACEBOOK_NAMESPACE:Ljava/lang/String; = "AM-FACEBOOK"

.field static final GOOGLE_PLUS_NAMESPACE:Ljava/lang/String; = "AM-GOOGLE"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getFacebookNamespace()Ljava/lang/String;
    .locals 1

    .prologue
    .line 69
    const-string v0, "AM-FACEBOOK"

    return-object v0
.end method

.method public static getGooglePlusNamespace()Ljava/lang/String;
    .locals 1

    .prologue
    .line 65
    const-string v0, "AM-GOOGLE"

    return-object v0
.end method

.method public static getRequestCode(Ljava/lang/String;)I
    .locals 2
    .param p0, "namespace"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 54
    if-nez p0, :cond_1

    .line 61
    :cond_0
    :goto_0
    return v0

    .line 56
    :cond_1
    invoke-static {}, Lcom/disney/id/android/external/DIDExternalUtils;->getGooglePlusNamespace()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 57
    const/16 v0, 0x301

    goto :goto_0

    .line 58
    :cond_2
    invoke-static {}, Lcom/disney/id/android/external/DIDExternalUtils;->getFacebookNamespace()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 59
    const/16 v0, 0x300

    goto :goto_0
.end method

.method public static getSupportedExternals(Landroid/content/Context;)Ljava/util/List;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 19
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .local v1, "supportedNamespaces":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {}, Lcom/disney/id/android/external/DIDExternalFactory;->instance()Lcom/disney/id/android/external/DIDExternalFactory;

    move-result-object v2

    const/16 v3, 0x301

    invoke-virtual {v2, v3}, Lcom/disney/id/android/external/DIDExternalFactory;->createExternal(I)Lcom/disney/id/android/external/DIDExternal;

    move-result-object v0

    .line 24
    .local v0, "mDIDExternal":Lcom/disney/id/android/external/DIDExternal;
    if-eqz v0, :cond_0

    .line 25
    invoke-virtual {v0, p0}, Lcom/disney/id/android/external/DIDExternal;->setContext(Landroid/content/Context;)V

    .line 26
    invoke-virtual {v0}, Lcom/disney/id/android/external/DIDExternal;->isAvailable()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 27
    invoke-virtual {v0}, Lcom/disney/id/android/external/DIDExternal;->getNamespace()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    :cond_0
    invoke-static {}, Lcom/disney/id/android/external/DIDExternalFactory;->instance()Lcom/disney/id/android/external/DIDExternalFactory;

    move-result-object v2

    const/16 v3, 0x300

    invoke-virtual {v2, v3}, Lcom/disney/id/android/external/DIDExternalFactory;->createExternal(I)Lcom/disney/id/android/external/DIDExternal;

    move-result-object v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    invoke-virtual {v0, p0}, Lcom/disney/id/android/external/DIDExternal;->setContext(Landroid/content/Context;)V

    .line 35
    invoke-virtual {v0}, Lcom/disney/id/android/external/DIDExternal;->isAvailable()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 36
    invoke-virtual {v0}, Lcom/disney/id/android/external/DIDExternal;->getNamespace()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 39
    :cond_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_2

    .line 42
    .end local v1    # "supportedNamespaces":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_0
    return-object v1

    .restart local v1    # "supportedNamespaces":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static getSupportedExternalsQuery(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 46
    invoke-static {p0}, Lcom/disney/id/android/external/DIDExternalUtils;->getSupportedExternals(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    .line 47
    .local v0, "supportedExternals":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v0, :cond_0

    .line 48
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "socialLoginSupported="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-static {v2, v0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 50
    :goto_0
    return-object v1

    :cond_0
    const-string v1, "socialLoginSupported="

    goto :goto_0
.end method
