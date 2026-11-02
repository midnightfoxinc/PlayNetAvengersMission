.class public final Lorg/jboss/netty/util/ExternalResourceUtil;
.super Ljava/lang/Object;
.source "ExternalResourceUtil.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    return-void
.end method

.method public static varargs release([Lorg/jboss/netty/util/ExternalResourceReleasable;)V
    .locals 9
    .param p0, "releasables"    # [Lorg/jboss/netty/util/ExternalResourceReleasable;

    .prologue
    .line 28
    array-length v6, p0

    new-array v5, v6, [Lorg/jboss/netty/util/ExternalResourceReleasable;

    .line 31
    .local v5, "releasablesCopy":[Lorg/jboss/netty/util/ExternalResourceReleasable;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v6, p0

    if-ge v2, v6, :cond_1

    .line 32
    aget-object v6, p0, v2

    if-nez v6, :cond_0

    .line 33
    new-instance v6, Ljava/lang/NullPointerException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "releasables["

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v8, 0x5d

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 35
    :cond_0
    aget-object v6, p0, v2

    aput-object v6, v5, v2

    .line 31
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 38
    :cond_1
    move-object v0, v5

    .local v0, "arr$":[Lorg/jboss/netty/util/ExternalResourceReleasable;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_1
    if-ge v3, v4, :cond_2

    aget-object v1, v0, v3

    .line 39
    .local v1, "e":Lorg/jboss/netty/util/ExternalResourceReleasable;
    invoke-interface {v1}, Lorg/jboss/netty/util/ExternalResourceReleasable;->releaseExternalResources()V

    .line 38
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 41
    .end local v1    # "e":Lorg/jboss/netty/util/ExternalResourceReleasable;
    :cond_2
    return-void
.end method
