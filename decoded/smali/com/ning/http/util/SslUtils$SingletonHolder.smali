.class Lcom/ning/http/util/SslUtils$SingletonHolder;
.super Ljava/lang/Object;
.source "SslUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/util/SslUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SingletonHolder"
.end annotation


# static fields
.field public static final instance:Lcom/ning/http/util/SslUtils;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 57
    new-instance v0, Lcom/ning/http/util/SslUtils;

    invoke-direct {v0}, Lcom/ning/http/util/SslUtils;-><init>()V

    sput-object v0, Lcom/ning/http/util/SslUtils$SingletonHolder;->instance:Lcom/ning/http/util/SslUtils;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
