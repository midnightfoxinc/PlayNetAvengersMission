.class public Lcom/ning/http/util/StringCharSequence;
.super Ljava/lang/Object;
.source "StringCharSequence.java"

# interfaces
.implements Ljava/lang/CharSequence;


# instance fields
.field public final length:I

.field private final offset:I

.field private final value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lcom/ning/http/util/StringCharSequence;->value:Ljava/lang/String;

    .line 28
    iput p2, p0, Lcom/ning/http/util/StringCharSequence;->offset:I

    .line 29
    iput p3, p0, Lcom/ning/http/util/StringCharSequence;->length:I

    .line 30
    return-void
.end method


# virtual methods
.method public charAt(I)C
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 39
    iget-object v0, p0, Lcom/ning/http/util/StringCharSequence;->value:Ljava/lang/String;

    iget v1, p0, Lcom/ning/http/util/StringCharSequence;->offset:I

    add-int/2addr v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    return v0
.end method

.method public length()I
    .locals 1

    .prologue
    .line 34
    iget v0, p0, Lcom/ning/http/util/StringCharSequence;->length:I

    return v0
.end method

.method public subSequence(II)Ljava/lang/CharSequence;
    .locals 5
    .param p1, "start"    # I
    .param p2, "end"    # I

    .prologue
    .line 44
    iget v1, p0, Lcom/ning/http/util/StringCharSequence;->offset:I

    add-int v0, v1, p2

    .line 45
    .local v0, "offsetedEnd":I
    iget v1, p0, Lcom/ning/http/util/StringCharSequence;->length:I

    if-ge v0, v1, :cond_0

    .line 46
    new-instance v1, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v1

    .line 47
    :cond_0
    new-instance v1, Lcom/ning/http/util/StringCharSequence;

    iget-object v2, p0, Lcom/ning/http/util/StringCharSequence;->value:Ljava/lang/String;

    iget v3, p0, Lcom/ning/http/util/StringCharSequence;->offset:I

    add-int/2addr v3, p1

    sub-int v4, p2, p1

    invoke-direct {v1, v2, v3, v4}, Lcom/ning/http/util/StringCharSequence;-><init>(Ljava/lang/String;II)V

    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 52
    iget-object v0, p0, Lcom/ning/http/util/StringCharSequence;->value:Ljava/lang/String;

    iget v1, p0, Lcom/ning/http/util/StringCharSequence;->offset:I

    iget v2, p0, Lcom/ning/http/util/StringCharSequence;->length:I

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
