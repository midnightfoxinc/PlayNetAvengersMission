.class Lcom/disneymobile/mocha/NSPropertyListSerialization$Dict;
.super Ljava/lang/Object;
.source "NSPropertyListSerialization.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disneymobile/mocha/NSPropertyListSerialization;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Dict"
.end annotation


# static fields
.field public static final elementName:Ljava/lang/String; = "dict"


# instance fields
.field protected final children:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 568
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 571
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$Dict;->children:Ljava/util/HashMap;

    return-void
.end method

.method synthetic constructor <init>(Lcom/disneymobile/mocha/NSPropertyListSerialization$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/disneymobile/mocha/NSPropertyListSerialization$1;

    .prologue
    .line 568
    invoke-direct {p0}, Lcom/disneymobile/mocha/NSPropertyListSerialization$Dict;-><init>()V

    return-void
.end method
