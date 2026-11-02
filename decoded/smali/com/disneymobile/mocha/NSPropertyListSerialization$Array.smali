.class Lcom/disneymobile/mocha/NSPropertyListSerialization$Array;
.super Ljava/lang/Object;
.source "NSPropertyListSerialization.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disneymobile/mocha/NSPropertyListSerialization;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Array"
.end annotation


# static fields
.field public static final elementName:Ljava/lang/String; = "array"


# instance fields
.field protected final children:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 575
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 578
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$Array;->children:Ljava/util/ArrayList;

    return-void
.end method

.method synthetic constructor <init>(Lcom/disneymobile/mocha/NSPropertyListSerialization$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/disneymobile/mocha/NSPropertyListSerialization$1;

    .prologue
    .line 575
    invoke-direct {p0}, Lcom/disneymobile/mocha/NSPropertyListSerialization$Array;-><init>()V

    return-void
.end method
