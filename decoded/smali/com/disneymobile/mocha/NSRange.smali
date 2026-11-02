.class public Lcom/disneymobile/mocha/NSRange;
.super Ljava/lang/Object;
.source "NSRange.java"


# instance fields
.field private length:I

.field private location:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput v0, p0, Lcom/disneymobile/mocha/NSRange;->location:I

    .line 18
    iput v0, p0, Lcom/disneymobile/mocha/NSRange;->length:I

    .line 19
    return-void
.end method

.method public constructor <init>(II)V
    .locals 0
    .param p1, "newLocation"    # I
    .param p2, "newLength"    # I

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput p1, p0, Lcom/disneymobile/mocha/NSRange;->location:I

    .line 23
    iput p2, p0, Lcom/disneymobile/mocha/NSRange;->length:I

    .line 24
    return-void
.end method

.method public static range()Lcom/disneymobile/mocha/NSRange;
    .locals 1

    .prologue
    .line 9
    new-instance v0, Lcom/disneymobile/mocha/NSRange;

    invoke-direct {v0}, Lcom/disneymobile/mocha/NSRange;-><init>()V

    return-object v0
.end method

.method public static range(II)Lcom/disneymobile/mocha/NSRange;
    .locals 1
    .param p0, "location"    # I
    .param p1, "length"    # I

    .prologue
    .line 13
    new-instance v0, Lcom/disneymobile/mocha/NSRange;

    invoke-direct {v0, p0, p1}, Lcom/disneymobile/mocha/NSRange;-><init>(II)V

    return-object v0
.end method


# virtual methods
.method public length()I
    .locals 1

    .prologue
    .line 31
    iget v0, p0, Lcom/disneymobile/mocha/NSRange;->length:I

    return v0
.end method

.method public location()I
    .locals 1

    .prologue
    .line 27
    iget v0, p0, Lcom/disneymobile/mocha/NSRange;->location:I

    return v0
.end method
